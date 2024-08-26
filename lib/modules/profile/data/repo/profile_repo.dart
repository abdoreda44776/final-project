import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iti_final_project/helpers/cloud_firestore_failure.dart';
import 'package:iti_final_project/helpers/failure.dart';
import 'package:iti_final_project/helpers/firebase_auth_failure.dart';
import 'package:iti_final_project/models/user_model.dart';

class ProfileRepo {
  final FirebaseFirestore firebaseFirestoreInstance;
  final FirebaseAuth firebaseAuthInstance;

  ProfileRepo(
    this.firebaseFirestoreInstance,
    this.firebaseAuthInstance,
  );

  Future<Either<Failure, UserModel>> getProfileData(String token) async {
    try {
      final response =
          await firebaseFirestoreInstance.collection('users').doc(token).get();
      UserModel userModel = UserModel.fromMap(response.data()!);
      return Right(userModel);
    } catch (error) {
      if (error is FirebaseException) {
        return Left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return Left(CloudFirestoreFailure(error.toString()));
      }
    }
  }

  Future<Either<Failure, Unit>> logout() async {
    try {
      await firebaseAuthInstance.signOut();
      return const Right(unit);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }
}
