import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'ad_event.dart';
part 'ad_state.dart';

class AdBloc extends Bloc<AdEvent, AdState> {
  int currentStep = 0;
  AdBloc() : super(StepOneState());

  @override
  Stream<AdState> mapEventToState(AdEvent event) async* {
    if (event is NextStepEvent) {
      yield* _mapNextStepToState(event);
    } else if (event is PreviousStepEvent) {
      yield* _mapPreviousStepToState(event);
    } else if (event is PublishEvent) {
      // Firebase post
      yield const AdSuccess("Ad successfully published!");
    }
  }

  Stream<AdState> _mapNextStepToState(NextStepEvent event) async* {
    AdState currentState = state;
    if (currentState is StepOneState) {
      yield StepTwoState();
    } else if (currentState is StepTwoState) {
      yield StepThreeState();
    } else if (currentState is StepThreeState) {
      yield StepFourState();
    } else if (currentState is StepFourState) {
      yield StepFiveState();
    }
  }

  Stream<AdState> _mapPreviousStepToState(PreviousStepEvent event) async* {
    AdState currentState = state;
    if (currentState is StepFiveState) {
      yield StepFourState();
    } else if (currentState is StepFourState) {
      yield StepThreeState();
    } else if (currentState is StepThreeState) {
      yield StepTwoState();
    } else if (currentState is StepTwoState) {
      yield StepOneState();
    }
  }
}
