import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:ezycourse_community/core/theme/app_text_styles.dart';
import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';
import 'package:flutter/material.dart';

class ChannelDrawer extends StatelessWidget {
  final List<CommunityChannelEntity> channels;
  final Function(int spaceId) onChannelSelected;
  final int? activeChannelId;
  final String coverImage;

  const ChannelDrawer({
    super.key,
    required this.channels,
    required this.onChannelSelected,
    this.activeChannelId,
    required this.coverImage,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header with cover image
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Stack(
              children: [
                // Cover image
                if (coverImage.isNotEmpty)
                  Positioned.fill(
                    child: Image.network(
                      coverImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.primary,
                      ),
                    ),
                  )
                else
                  Positioned.fill(
                    child: Container(color: AppColors.primary),
                  ),
                // Dark overlay for text readability
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.3),
                          Colors.black.withValues(alpha: 0.6),
                        ],
                      ),
                    ),
                  ),
                ),
                // Content
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    MediaQuery.of(context).padding.top + 24,
                    20,
                    20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.tag_rounded,
                          color: AppColors.accent,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Channels',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${channels.length} channels',
                        style: TextStyle(
                          color: AppColors.textWhite.withValues(alpha: 0.6),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Channel list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              itemCount: channels.length,
              itemBuilder: (context, index) {
                final channel = channels[index];
                final isActive = channel.channelId == activeChannelId;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Material(
                    color: isActive
                        ? AppColors.primary.withValues(alpha: 0.08)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: () {
                        onChannelSelected(channel.channelId);
                        Navigator.of(context).pop();
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.tag_rounded,
                              size: 20,
                              color: isActive
                                  ? AppColors.primary
                                  : AppColors.textGrey,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                channel.channelName,
                                style: AppTextStyles.cardTitle.copyWith(
                                  fontSize: 14,
                                  color: isActive
                                      ? AppColors.primary
                                      : AppColors.textDark,
                                  fontWeight: isActive
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                            if (isActive)
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
