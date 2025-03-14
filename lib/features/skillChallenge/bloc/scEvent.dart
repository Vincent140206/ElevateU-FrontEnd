abstract class SkillChallengeEvent {}

class CreateSkillChallenge extends SkillChallengeEvent {
  final String groupId;
  final String title;
  final String subtitle;
  final String description;
  final String difficulty;
  final bool isFree;

  CreateSkillChallenge({
    required this.groupId,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.difficulty,
    required this.isFree,
  });
}

class CreateSkillChallengeGroup extends SkillChallengeEvent {
  final String category_id ;
  final String title;
  final String description;
  final String thumbnail;

  CreateSkillChallengeGroup({
    required this.category_id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });
}