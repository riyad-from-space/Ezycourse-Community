import '../../domain/entities/enums.dart';
import '../../domain/entities/reaction_entity.dart';

/// Model for parsing reaction JSON and converting to ReactionEntity
class ReactionModel {
  final String reactionType;
  final int feedId;
  final Map<String, dynamic> meta;

  ReactionModel({
    required this.reactionType,
    required this.feedId,
    required this.meta,
  });

  /// Parse from JSON
  factory ReactionModel.fromJson(Map<String, dynamic> json) {
    return ReactionModel(
      reactionType: json['reaction_type'] ?? 'LIKE',
      feedId: json['feed_id'] ?? 0,
      meta: json['meta'] ?? {},
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'reaction_type': reactionType,
      'feed_id': feedId,
      'meta': meta,
    };
  }

  /// Convert to domain entity
  ReactionEntity toEntity() {
    return ReactionEntity(
      reactionType: ReactionType.fromString(reactionType),
      feedId: feedId,
      meta: meta,
    );
  }

  /// Convert from domain entity
  factory ReactionModel.fromEntity(ReactionEntity entity) {
    return ReactionModel(
      reactionType: entity.reactionType.name.toUpperCase(),
      feedId: entity.feedId,
      meta: entity.meta,
    );
  }
}
