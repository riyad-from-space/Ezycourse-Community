/// Enum definitions for community domain entities

enum FeedStatus {
  approved,
  pending,
  rejected,
  draft;

  static FeedStatus fromString(String value) {
    return FeedStatus.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => FeedStatus.pending,
    );
  }
}

enum ActivityType {
  group,
  poll,
  announcement,
  shared;

  static ActivityType fromString(String value) {
    return ActivityType.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => ActivityType.group,
    );
  }
}

enum FileType {
  text,
  photos,
  video,
  document,
  audio;

  static FileType fromString(String value) {
    return FileType.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => FileType.text,
    );
  }
}

enum FeedPrivacy {
  public,
  private,
  members;

  static FeedPrivacy fromString(String value) {
    return FeedPrivacy.values.firstWhere(
      (e) => e.name == value || e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => FeedPrivacy.public,
    );
  }
}

enum MediaType {
  image,
  video,
  document,
  audio;

  static MediaType fromString(String value) {
    return MediaType.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => MediaType.image,
    );
  }
}

enum UserStatus {
  active,
  inactive,
  suspended,
  deleted;

  static UserStatus fromString(String value) {
    return UserStatus.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => UserStatus.active,
    );
  }
}

enum UserType {
  student,
  instructor,
  admin,
  moderator;

  static UserType fromString(String value) {
    return UserType.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => UserType.student,
    );
  }
}

enum ReactionType {
  like,
  love,
  haha,
  wow,
  sad,
  angry;

  static ReactionType fromString(String value) {
    return ReactionType.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => ReactionType.like,
    );
  }
}
