import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/models/register_request_model.dart';
import 'package:iti_final_project/modules/register/data/repo/register_repo.dart';
import 'package:iti_final_project/modules/register/presentation/cubit/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;

  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future register() async {
    emit(RegisterLoading());
    final response = await registerRepo.register(
      RegisterRequestModel(
        userName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (userModel) => emit(RegisterSuccess(userModel)),
    );
  }
}
