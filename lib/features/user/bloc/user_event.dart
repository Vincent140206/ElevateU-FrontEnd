import 'dart:io';

abstract class UserEvent {}

class DeleteUserRequested extends UserEvent {}

class GetUserRequested extends UserEvent {}

class PatchUserRequested extends UserEvent {
  final String name;
  final String email;
  final String role;
  final String universitas;
  final String jurusan;

  PatchUserRequested({
  required this.name,
  required this.email,
  required this.role,
  required this.universitas,
  required this.jurusan,
  });
}

class UpdateAvatarRequested extends UserEvent {
  final File imageFile;

  UpdateAvatarRequested(this.imageFile,);
}
