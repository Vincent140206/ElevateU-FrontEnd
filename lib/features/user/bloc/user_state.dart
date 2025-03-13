abstract class UserState {}

class UserInitial extends UserState{}

class UserLoading extends UserState{}

class UserSuccess extends UserState{}

class UserAvatarUpdated extends UserState {
  final String imageUrl;

  UserAvatarUpdated(this.imageUrl);
}

class UserFailure extends UserState{
  final String error;

  UserFailure(this.error);
}

class UpdateAvatarRequestedFailure extends UserState {
  final String error;
  UpdateAvatarRequestedFailure(this.error);
}