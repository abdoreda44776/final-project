import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_final_project/helpers/failure.dart';
import 'package:iti_final_project/helpers/firebase_auth_failure.dart';
import 'package:iti_final_project/models/login_request_model.dart';

class LoginRepo {
  final FirebaseAuth firebaseAuthInstance;

  LoginRepo(this.firebaseAuthInstance);

  Future<Either<Failure, UserCredential>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await firebaseAuthInstance.signInWithEmailAndPassword(
        email: loginRequestModel.email,
        password: loginRequestModel.password,
      );
      return Right(response);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }
}
