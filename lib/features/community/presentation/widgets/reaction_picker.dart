import 'package:flutter/material.dart';

class ReactionPicker extends StatelessWidget {
  final Function(String reactionType, String emoji) onReactionSelected;

  const ReactionPicker({
    super.key,
    required this.onReactionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Choose Reaction',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildReactionButton(context, '👍', 'LIKE'),
                _buildReactionButton(context, '❤️', 'LOVE'),
                _buildReactionButton(context, '😂', 'HAHA'),
                _buildReactionButton(context, '😮', 'WOW'),
                _buildReactionButton(context, '😢', 'SAD'),
                _buildReactionButton(context, '😡', 'ANGRY'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReactionButton(BuildContext context, String emoji, String label) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        onReactionSelected(label, emoji);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  static void show(
    BuildContext context, {
    required Function(String reactionType, String emoji) onReactionSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ReactionPicker(onReactionSelected: onReactionSelected);
      },
    );
  }
}
