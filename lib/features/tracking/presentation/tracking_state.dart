abstract class TrackingState {}

class TrackingInitState extends TrackingState {}

class TrackingLoadingState extends TrackingState {}

class TrackingSuccessState extends TrackingState {}

class TrackingErrorState extends TrackingState {
  final String error;

  TrackingErrorState(this.error);
}
