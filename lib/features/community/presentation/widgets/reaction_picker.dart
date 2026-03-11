import 'package:ezycourse_community/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ReactionPicker extends StatelessWidget {
  final Function(String reactionType, String emoji) onReactionSelected;
  final String? currentReaction;

  const ReactionPicker({
    super.key,
    required this.onReactionSelected,
    this.currentReaction,
  });

  static const _reactions = [
    ('👍', 'LIKE'),
    ('❤️', 'LOVE'),
    ('😂', 'HAHA'),
    ('😮', 'WOW'),
    ('😢', 'SAD'),
    ('😡', 'ANGRY'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.cardBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'React to this post',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _reactions.map((r) {
              final isSelected =
                  currentReaction?.toUpperCase() == r.$2;
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  onReactionSelected(r.$2, r.$1);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    border: isSelected
                        ? Border.all(
                            color: AppColors.primary.withValues(alpha: 0.3),
                          )
                        : null,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(r.$1, style: const TextStyle(fontSize: 28)),
                      const SizedBox(height: 4),
                      Text(
                        r.$2,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  static void show(
    BuildContext context, {
    required Function(String reactionType, String emoji) onReactionSelected,
    String? currentReaction,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ReactionPicker(
          onReactionSelected: onReactionSelected,
          currentReaction: currentReaction,
        );
      },
    );
  }
}
