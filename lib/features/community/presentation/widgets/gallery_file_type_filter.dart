import 'package:flutter/material.dart';

class GalleryFileTypeFilter extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onTypeChanged;

  const GalleryFileTypeFilter({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _FilterChip(
            label: 'Images',
            type: 'image',
            isSelected: selectedType == 'image',
            onTap: onTypeChanged,
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Videos',
            type: 'video',
            isSelected: selectedType == 'video',
            onTap: onTypeChanged,
          ),
          const SizedBox(width: 8),
          _FilterChip(
            label: 'Audio',
            type: 'audio',
            isSelected: selectedType == 'audio',
            onTap: onTypeChanged,
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final String type;
  final bool isSelected;
  final ValueChanged<String> onTap;

  const _FilterChip({
    required this.label,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(type),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
