part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

class RegisterSuccesState extends RegisterState {
  final String uId;

  const RegisterSuccesState(this.uId, );
  @override
  List<Object> get props => [];
  void navigate(BuildContext context) {
 
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignInPage()));
  }
}

final class RegisterErrorState extends RegisterState {
  final String errorMessage;

  const RegisterErrorState(this.errorMessage);
  @override
  List<Object> get props => [];
}
