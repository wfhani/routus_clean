import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:routus_clean/components/error_view.dart';
import 'package:routus_clean/features/notifications/data/repository/notitifactions_repository.dart';
import 'package:routus_clean/features/notifications/presentaion/notifications/notifications_state.dart';
import 'package:routus_clean/features/notifications/presentaion/notifications/widgets/notifcation_card.dart';
import 'notifications_cubit.dart';
import 'widgets/all_unread_filter.dart';
import 'widgets/empty_notification_view.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NotificationsRepository(),
      child: BlocProvider(
        create: (BuildContext context) =>
            NotificationsCubit(context.read<NotificationsRepository>()),
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF052A43),
                Color(0xFF0D6AA9),
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text(
                'Notifications',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
              leading: const BackButton(color: Colors.white),
            ),
            body: BlocBuilder<NotificationsCubit, NotificationsState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<NotificationsCubit>(context);
                if (state is NotificationsSuccessState) {
                  return state.notifications.isEmpty
                      ? const EmptyNotificationsView()
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const AllUnreadFilter(),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: state.notifications.length,
                                  itemBuilder: (context, index) {
                                    return NotificationCard(
                                      notificationItem:
                                          state.notifications[index],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                } else if (state is NotificationsErrorState) {
                  return ErrorView(
                    message: state.error,
                    onRetry: () => cubit.fetchNotifications(),
                  );
                } else {
                  return LoadingAnimationWidget.hexagonDots(
                    color: Colors.white,
                    size: 36,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
