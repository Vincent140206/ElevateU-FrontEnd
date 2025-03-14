import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:elevateu_bcc_new/core/services/user_services.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_event.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LocalStorageService localStorageService = LocalStorageService();
  final UserServices userServices;
  final Dio dio;

  void setBearerToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  UserBloc(this.dio, this.userServices) : super(UserInitial()) {
    on<DeleteUserRequested>((event, emit) async {
      debugPrint('DeleteUser  Requested event received');
      emit(UserLoading());
      try {
        String token = await localStorageService.getBearerToken();
        userServices.setBearerToken(token);
        await userServices.deleteUser();
        emit(UserSuccess());
      } catch (e) {
        emit(UserFailure(e.toString()));
      }
    });

    on<GetUserRequested>((event, emit) async {
      emit(UserLoading());
      try {
        String token = await localStorageService.getBearerToken();
        userServices.setBearerToken(token);
        await userServices.getUser();
        emit(UserSuccess());
      } catch (e) {
        emit(UserFailure(e.toString()));
      }
    });

    on<PatchUserRequested>((event, emit) async {
      emit(UserLoading());
      try {
        String token = await localStorageService.getBearerToken();
        userServices.setBearerToken(token);

        await userServices.patchUser (
          event.name,
          event.email,
          event.universitas,
          event.jurusan,
          event.role,
        );

        await localStorageService.saveUserData(
          event.name,
          event.email,
          event.password,
          event.role,
        );
        emit(UserSuccess());
      } catch (e) {
        emit(UserFailure(e.toString()));
      }
    });

    on<UpdateAvatarRequested>((event, emit) async {
      emit(UserLoading());
      try {
        String token = await localStorageService.getBearerToken();
        userServices.setBearerToken(token);
        String imageUrl = await userServices.updateAvatar(event.imageFile);
        emit(UserAvatarUpdated(imageUrl));
      } catch (e) {
        emit(UserFailure('Error: ${e.toString()}'));
      }
    });

    on<DeleteAvatarRequested>((event, emit) async {
      emit(UserLoading());
      try {
        String token = await localStorageService.getBearerToken();
        userServices.setBearerToken(token);

        await userServices.deleteAvatar();

        emit(UserSuccess());
      } catch (e) {
        emit(UserFailure(e.toString()));
      }
    });
  }
}