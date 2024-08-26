import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:iti_final_project/modules/profile/data/repo/profile_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final ProfileRepo profileRepo;

  LogoutCubit(this.profileRepo) : super(LogoutInitial());

  Future logout() async {
    emit(LogoutLoading());
    final result = await profileRepo.logout();
    result.fold(
      (failure) => emit(LogoutFailure(failure.message)),
      (unit) => emit(LogoutSuccess()),
    );
  }
}
