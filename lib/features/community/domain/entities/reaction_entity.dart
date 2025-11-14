import 'package:equatable/equatable.dart';
import 'enums.dart';

/// Entity representing a reaction/like on a feed post
class ReactionEntity extends Equatable {
  final ReactionType reactionType;
  final int feedId;
  final Map<String, dynamic> meta;

  const ReactionEntity({
    required this.reactionType,
    required this.feedId,
    required this.meta,
  });

  /// Check if this is a like reaction
  bool get isLike => reactionType == ReactionType.like;

  /// Check if this is a love reaction
  bool get isLove => reactionType == ReactionType.love;

  /// Get emoji representation of reaction
  String get emoji {
    switch (reactionType) {
      case ReactionType.like:
        return '👍';
      case ReactionType.love:
        return '❤️';
      case ReactionType.haha:
        return '😂';
      case ReactionType.wow:
        return '😮';
      case ReactionType.sad:
        return '😢';
      case ReactionType.angry:
        return '😠';
    }
  }

  @override
  List<Object?> get props => [reactionType, feedId, meta];
}
