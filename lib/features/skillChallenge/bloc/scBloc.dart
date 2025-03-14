import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:elevateu_bcc_new/features/skillChallenge/bloc/scEvent.dart';
import 'package:elevateu_bcc_new/features/skillChallenge/bloc/scServices.dart';
import 'package:elevateu_bcc_new/features/skillChallenge/bloc/scState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillChallengeBloc extends Bloc<SkillChallengeEvent,SkillChallengeState> {
  LocalStorageService localStorageService;
  SCServices scServices;
  final Dio dio;

  SkillChallengeBloc(this.dio, this.localStorageService, this.scServices) : super(SkillChallengeInitial()) {

    on<CreateSkillChallenge>((event, state) async {
      String token = await localStorageService.getBearerToken();
      scServices.setBearerToken(token);
      emit(SkillChallengeLoading());
      try {
        await scServices.createSC(
          groupId: event.groupId,
          title: event.title,
          subtitle: event.subtitle,
          description: event.description,
          difficulty: event.difficulty,
          isFree: event.isFree,
        );
        emit(SkillChallengeSuccess());
      } catch (e) {
        emit(SkillChallengeFailure(e.toString()));
      }
    });

    on<CreateSkillChallengeGroup>((event, state) async {
      String token = await localStorageService.getBearerToken();
      scServices.setBearerToken(token);
      emit(SkillChallengeLoading());
      try {
        await scServices.createSCGroup(
            category_id: event.category_id,
            title: event.title,
            description: event.description,
            thumbnailPath: event.thumbnail,
            token: token
        );
        emit(SkillChallengeSuccess());
      } catch (e) {
        emit(SkillChallengeFailure(e.toString()));
      }
    });

  }
}