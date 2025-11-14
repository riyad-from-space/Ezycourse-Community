import '../../domain/entities/poll_entity.dart';
import 'user_model.dart';

/// Model for parsing poll option JSON and converting to PollOptionEntity
class PollOptionModel {
  final int id;
  final int userId;
  final int pollId;
  final String text;
  final int totalVote;
  final String createdAt;
  final String updatedAt;
  final UserModel user;
  final bool? isVoted;
  final List<dynamic> voteOption;

  PollOptionModel({
    required this.id,
    required this.userId,
    required this.pollId,
    required this.text,
    required this.totalVote,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    this.isVoted,
    required this.voteOption,
  });

  /// Parse from JSON
  factory PollOptionModel.fromJson(Map<String, dynamic> json) {
    return PollOptionModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      pollId: json['poll_id'] ?? 0,
      text: json['text'] ?? '',
      totalVote: json['total_vote'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
      isVoted: json['isVoted'],
      voteOption: List<dynamic>.from(json['voteOption'] ?? []),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'poll_id': pollId,
      'text': text,
      'total_vote': totalVote,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user': user.toJson(),
      'isVoted': isVoted,
      'voteOption': voteOption,
    };
  }

  /// Convert to domain entity
  PollOptionEntity toEntity() {
    return PollOptionEntity(
      id: id,
      userId: userId,
      pollId: pollId,
      text: text,
      totalVote: totalVote,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      user: user.toEntity(),
      isVoted: isVoted,
      voteOption: voteOption,
    );
  }

  /// Convert from domain entity
  factory PollOptionModel.fromEntity(PollOptionEntity entity) {
    return PollOptionModel(
      id: entity.id,
      userId: entity.userId,
      pollId: entity.pollId,
      text: entity.text,
      totalVote: entity.totalVote,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
      user: UserModel.fromEntity(entity.user),
      isVoted: entity.isVoted,
      voteOption: entity.voteOption,
    );
  }
}

/// Model for parsing poll JSON and converting to PollEntity
class PollModel {
  final int id;
  final int isMultipleSelected;
  final int allowUserAddOption;
  final String createdAt;
  final String updatedAt;
  final String voteByAnyOne;
  final bool? isVotedOne;
  final List<PollOptionModel> pollOptions;

  PollModel({
    required this.id,
    required this.isMultipleSelected,
    required this.allowUserAddOption,
    required this.createdAt,
    required this.updatedAt,
    required this.voteByAnyOne,
    this.isVotedOne,
    required this.pollOptions,
  });

  /// Parse from JSON
  factory PollModel.fromJson(Map<String, dynamic> json) {
    return PollModel(
      id: json['id'] ?? 0,
      isMultipleSelected: json['is_multiple_selected'] ?? 0,
      allowUserAddOption: json['allow_user_add_option'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      voteByAnyOne: json['vote_by_any_one'] ?? 'no',
      isVotedOne: json['isVotedOne'],
      pollOptions: (json['pollOptions'] as List<dynamic>?)
              ?.map((option) => PollOptionModel.fromJson(option))
              .toList() ??
          [],
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_multiple_selected': isMultipleSelected,
      'allow_user_add_option': allowUserAddOption,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'vote_by_any_one': voteByAnyOne,
      'isVotedOne': isVotedOne,
      'pollOptions': pollOptions.map((option) => option.toJson()).toList(),
    };
  }

  /// Convert to domain entity
  PollEntity toEntity() {
    return PollEntity(
      id: id,
      isMultipleSelected: isMultipleSelected == 1,
      allowUserAddOption: allowUserAddOption == 1,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      voteByAnyOne: voteByAnyOne,
      isVotedOne: isVotedOne,
      options: pollOptions.map((option) => option.toEntity()).toList(),
    );
  }

  /// Convert from domain entity
  factory PollModel.fromEntity(PollEntity entity) {
    return PollModel(
      id: entity.id,
      isMultipleSelected: entity.isMultipleSelected ? 1 : 0,
      allowUserAddOption: entity.allowUserAddOption ? 1 : 0,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt.toIso8601String(),
      voteByAnyOne: entity.voteByAnyOne,
      isVotedOne: entity.isVotedOne,
      pollOptions:
          entity.options.map((option) => PollOptionModel.fromEntity(option)).toList(),
    );
  }
}
