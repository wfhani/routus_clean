import 'package:bloc/bloc.dart';
import 'package:routus_clean/features/notifications/data/models/notifcations_response.dart';
import 'package:routus_clean/features/notifications/data/repository/notitifactions_repository.dart';

import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._notificationsRepository)
      : super(NotificationsInitState()) {
    fetchNotifications();
  }

  final NotificationsRepository _notificationsRepository;
  List<NotificationItem> _allNotifications = [];

  List<String> filters = ['All', 'Unread'];
  String selectedFilter = 'All';

  fetchNotifications() async {
    emit(NotificationsLoadingState());
    try {
      final response = await _notificationsRepository.fetchNotifications();
      _allNotifications = response.notifications ?? [];
      emit(NotificationsSuccessState(_allNotifications));
    } catch (e) {
      emit(NotificationsErrorState('$e'));
    }
  }

  applyAllFilter() {
    selectedFilter = 'All';
    emit(NotificationsSuccessState(_allNotifications));
  }

  applyUnreadFilter() {
    selectedFilter = 'Unread';
    final unread =
        _allNotifications.where((element) => element.readAt == null).toList();
    emit(NotificationsSuccessState(unread));
  }
}
