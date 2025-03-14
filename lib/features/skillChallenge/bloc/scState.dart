abstract class SkillChallengeState {}

class SkillChallengeInitial extends SkillChallengeState{}

class SkillChallengeLoading extends SkillChallengeState{}

class SkillChallengeSuccess extends SkillChallengeState{}

class SkillChallengeFailure extends SkillChallengeState{
  final String error;

  SkillChallengeFailure(this.error);
}