import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:routus_clean/components/children_filter/data/repository/children_filter_repository.dart';
import 'package:routus_clean/components/children_filter/presentation/children_filter_state.dart';
import 'package:routus_clean/components/error_view.dart';
import 'package:routus_clean/styles.dart';
import 'children_filter_cubit.dart';

class ChildrenFilterPage extends StatelessWidget {
  const ChildrenFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ChildrenFilterRepository(),
      child: BlocProvider(
        create: (BuildContext context) =>
            ChildrenFilterCubit(context.read<ChildrenFilterRepository>())
              ..fetchFilter(),
        child: BlocBuilder<ChildrenFilterCubit, ChildrenFilterState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<ChildrenFilterCubit>(context);
            if (state is ChildrenFilterLoadingState) {
              return LoadingAnimationWidget.hexagonDots(
                color: Colors.white,
                size: 36,
              );
            } else if (state is ChildrenFilterErrorState) {
              return ErrorView(
                message: state.error,
                onRetry: () => cubit.fetchFilter(),
              );
            } else if (state is ChildrenFilterSuccessState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Choose child',
                    style: TextStyle(
                        color: Styles.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.children.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pop(state.children[index].busId),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF052A43),
                                Color(0xFF0D6AA9),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.height *
                                        0.09,
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    state.children[index].photoUrl ?? ''),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.children[index].name ?? '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    state.children[index].schoolName ?? '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
