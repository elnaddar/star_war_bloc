import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_war_bloc/bloc/likes/likes_event.dart';
import 'package:star_war_bloc/bloc/likes/likes_state.dart';
import 'package:star_war_bloc/models/swapi_object.dart';
import 'package:star_war_bloc/services/storage_service.dart';

class LikesBloc extends Bloc<LikesEvents, LikesState> {
  final StorageService storageService;
  LikesBloc()
      : storageService = const StorageService(),
        super(LikesInitial()) {
    on<AddToLikes>(_mapAddToLikesToState);
    on<RemoveFromLikes>(_mapRemoveFromLikesState);
    on<GetLikes>(_mapGetLikesToState);
  }

  Future<FutureOr<void>> _mapAddToLikesToState(
      AddToLikes event, Emitter<LikesState> emit) async {
    try {
      final List<SwapiObject> likes = state.likes;
      likes.add(event.object);
      await storageService.save(likes);
      emit(LikesLoaded(likes));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(LikesError(e.toString()));
    }
  }

  Future<FutureOr<void>> _mapRemoveFromLikesState(
      RemoveFromLikes event, Emitter<LikesState> emit) async {
    try {
      final List<SwapiObject> likes = state.likes;
      likes.removeWhere((elm) => elm.url == event.object.url);
      await storageService.save(likes);
      emit(LikesLoaded(likes));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(LikesError(e.toString()));
    }
  }

  Future<FutureOr<void>> _mapGetLikesToState(
      GetLikes event, Emitter<LikesState> emit) async {
    try {
      List<SwapiObject> likes = await storageService.get();
      emit(LikesLoaded(likes));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(LikesError(e.toString()));
    }
  }
}
