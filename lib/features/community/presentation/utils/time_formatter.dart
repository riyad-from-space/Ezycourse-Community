class TimeFormatter {

  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).floor();
      return '$years${years == 1 ? 'y' : 'y'} ago';
    }
    
    if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months${months == 1 ? 'mo' : 'mo'} ago';
    }
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    }
    
    if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    }
    
    if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    }
    
    return 'Just now';
  }

  static String getInitials(String name) {
    final parts = name.trim().split(' ').where((p) => p.isNotEmpty).toList();
    
    if (parts.isEmpty) return 'U';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }
}