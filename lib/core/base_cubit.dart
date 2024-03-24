import 'package:bloc/bloc.dart';

base class BaseCubit<T> extends Cubit<T> {
  BaseCubit(super.initialState);

  void safeEmit(T state) {
    if (isClosed) return;

    emit(state);
  }
}
