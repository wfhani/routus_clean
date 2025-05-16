abstract class NotificationsState {}

class NotificationsInitState extends NotificationsState {}

class NotificationsLoadingState extends NotificationsState {}

class NotificationsErrorState extends NotificationsState {
  final String error;

  NotificationsErrorState(this.error);
}

class NotificationsSuccessState extends NotificationsState {
  final List notifications;

  NotificationsSuccessState(this.notifications);
}
