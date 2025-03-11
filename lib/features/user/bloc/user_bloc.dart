import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:elevateu_bcc_new/core/services/user_services.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_event.dart';
import 'package:elevateu_bcc_new/features/user/bloc/user_state.dart';
import 'package:flutter/cupertino.dart';
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

        String name = event.name.isNotEmpty ? event.name : 'Default Name';
        String instance = event.universitas.isNotEmpty ? event.universitas : 'Default University';
        String major = event.jurusan.isNotEmpty ? event.jurusan : 'Default Major';
        String specialization = event.role.isNotEmpty ? event.role : 'Default Specialization';
        String experience = 'Default Experience';
        int price = 0;

        final response = await dio.patch(
          ApiConstant.patchUser ,
          data: {
            "name": name,
            "student": {
              "instance": instance,
              "major": major,
            },
            "mentor": {
              "specialization": specialization,
              "experience": experience,
              "price": price,
            },
          },
        );

        if (response.statusCode == 204) {
          debugPrint("SUKSESSSSSSSSS PATCH");
          emit(UserSuccess());
        } else {
          emit(UserFailure('Failed to update user. Status code: ${response.statusCode}'));
        }
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
