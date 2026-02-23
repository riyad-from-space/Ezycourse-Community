import 'package:ezycourse_community/features/community/domain/entities/community_channel_entity.dart';
import 'package:flutter/material.dart';

class ChannelDrawer extends StatelessWidget {
  final List<CommunityChannelEntity> channels;
  final Function(int spaceId) onChannelSelected;

  const ChannelDrawer({
    super.key,
    required this.channels,
    required this.onChannelSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("Community Channel")),
          Expanded(
            child: ListView.builder(
              itemCount: channels.length,
              itemBuilder: (context, index) {
                final channel = channels[index];
                return ListTile(
                  title: Text(channel.channelName),

                  onTap: () {
                    onChannelSelected(channel.channelId);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
