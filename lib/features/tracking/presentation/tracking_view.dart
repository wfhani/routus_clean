import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:routus_clean/components/children_filter/presentation/children_filter_view.dart';
import 'package:routus_clean/components/error_view.dart';
import 'package:routus_clean/features/notifications/presentaion/notifications/notifications_view.dart';
import 'package:routus_clean/features/tracking/presentation/widgets/map_widget.dart';

import 'tracking_cubit.dart';
import 'tracking_state.dart';
import 'widgets/tracking_app_bar.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TrackingCubit(),
      child: Container(
        padding: const EdgeInsets.only(top: 8),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const TrackingAppBar(),
          body: BlocBuilder<TrackingCubit, TrackingState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<TrackingCubit>(context);
              if (state is TrackingSuccessState) {
                return const Column(
                  children: [
                    Text(
                      'Live Bus Tracking',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Stay updated with real-time bus location and movements.',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30)),
                          child: MapWidget()),
                    ),
                  ],
                );
              } else if (state is TrackingErrorState) {
                return ErrorView(
                  message: state.error,
                  onRetry: () => cubit.getCurrentLocation(),
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
    );
  }
}
