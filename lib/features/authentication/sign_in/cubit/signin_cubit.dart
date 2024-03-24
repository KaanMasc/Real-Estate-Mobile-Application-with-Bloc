import 'package:api/core/base_cubit.dart';
import 'package:api/features/main_page/main_page.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/auth_exception_handler.dart';
part 'signin_state.dart';

final class SignInCubit extends BaseCubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);
  bool isLoading = false;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(const SignInLoadingState(true));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(SignInSuccesState(FirebaseAuth.instance.currentUser!.uid));
    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState(e.getErrorMessage(e)));
    } finally {
      emit(const SignInLoadingState(false));
    }
  }

  Future<void> signOut() async {
    try {
      emit(const SignInLoadingState(true));
      await FirebaseAuth.instance.signOut();

      emit(SignInInitialState());
    } catch (e) {
      emit(SignInErrorState(e.toString()));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(SignInLoadingState(isLoading));
  }
}
