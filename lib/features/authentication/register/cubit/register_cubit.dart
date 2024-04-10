import 'package:api/features/authentication/sign_in/sign_in_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product/model/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void registerUser({
    required String email,
    required String fullName,
    required String password,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUser(
        uId: value.user!.uid,
        email: email,
        fullName: fullName,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void createUser({
    required String uId,
    required String email,
    required String fullName,
  }) {
    UserModel userModel = UserModel(
      uid: uId,
      email: email,
      fullName: fullName,
      photoURL: '',
      bio: 'Write your bio...',
    );

    emit(RegisterLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).set(userModel.toMap()).then((value) {
      emit(RegisterSuccesState(
        uId,
      ));
    }).catchError((error) {
      emit(RegisterErrorState(error));
    });
  }
}
