part of 'signin_cubit.dart';

@immutable
sealed class SignInStates extends Equatable {
  const SignInStates();
}

class SignInInitialState extends SignInStates {
  @override
  List<Object?> get props => [];
}

class SignInLoadingState extends SignInStates {
  final bool isLoading;

  const SignInLoadingState(this.isLoading);
  @override
  List<Object?> get props => [];
}

class SignInSuccesState extends SignInStates {
  final String uId;

  const SignInSuccesState(this.uId);

  @override
  List<Object?> get props => [uId];
  void navigate(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }
}

class SignInErrorState extends SignInStates {
  final String errorMessage;

  const SignInErrorState(
    this.errorMessage,
  );

  @override
  List<Object?> get props => [errorMessage];
}
