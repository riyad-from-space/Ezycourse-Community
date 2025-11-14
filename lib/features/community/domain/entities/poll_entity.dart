import 'package:equatable/equatable.dart';
import 'user_entity.dart';

/// Entity representing a poll option within a poll
class PollOptionEntity extends Equatable {
  final int id;
  final int userId;
  final int pollId;
  final String text;
  final int totalVote;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserEntity user;
  final bool? isVoted;
  final List<dynamic> voteOption;

  const PollOptionEntity({
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

  /// Check if current user voted for this option
  bool get hasVoted => isVoted ?? false;

  /// Get vote percentage (requires total votes from parent poll)
  double getVotePercentage(int totalVotesInPoll) {
    if (totalVotesInPoll == 0) return 0.0;
    return (totalVote / totalVotesInPoll) * 100;
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        pollId,
        text,
        totalVote,
        createdAt,
        updatedAt,
        user,
        isVoted,
        voteOption,
      ];
}

/// Entity representing a poll attached to a feed post
class PollEntity extends Equatable {
  final int id;
  final bool isMultipleSelected;
  final bool allowUserAddOption;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String voteByAnyOne;
  final bool? isVotedOne;
  final List<PollOptionEntity> options;

  const PollEntity({
    required this.id,
    required this.isMultipleSelected,
    required this.allowUserAddOption,
    required this.createdAt,
    required this.updatedAt,
    required this.voteByAnyOne,
    this.isVotedOne,
    required this.options,
  });

  /// Check if user can select multiple options
  bool get canSelectMultiple => isMultipleSelected;

  /// Check if user can add their own options
  bool get canAddOption => allowUserAddOption;

  /// Check if current user has voted
  bool get hasUserVoted => isVotedOne ?? false;

  /// Get total votes across all options
  int get totalVotes {
    return options.fold(0, (sum, option) => sum + option.totalVote);
  }

  /// Get the option with most votes
  PollOptionEntity? get winningOption {
    if (options.isEmpty) return null;
    return options.reduce(
      (curr, next) => curr.totalVote > next.totalVote ? curr : next,
    );
  }

  /// Check if poll has any votes
  bool get hasVotes => totalVotes > 0;

  @override
  List<Object?> get props => [
        id,
        isMultipleSelected,
        allowUserAddOption,
        createdAt,
        updatedAt,
        voteByAnyOne,
        isVotedOne,
        options,
      ];
}
