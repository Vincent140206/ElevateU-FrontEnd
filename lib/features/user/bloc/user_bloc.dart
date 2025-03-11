import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:elevateu_bcc_new/core/services/user_services.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_event.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/api.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LocalStorageService localStorageService = LocalStorageService();
  final UserServices userServices;
  final Dio dio;
  final Api api;

  void setBearerToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  UserBloc(this.dio, this.userServices, this.api) : super(UserInitial()) {
    on<DeleteUserRequested>((event, emit) async {
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
        await userServices.patchUser(
          name: event.name,
          email: event.email,
          role: event.role,
          universitas: event.universitas,
          jurusan: event.jurusan,
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
        await userServices.updateAvatar(event.imageFile);
        emit(UserSuccess());
      } catch (e) {
        emit(UserFailure(e.toString()));
      }
    });
  }
}
