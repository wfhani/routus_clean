import 'package:bloc/bloc.dart';

import '../data/repository/children_filter_repository.dart';
import 'children_filter_state.dart';

class ChildrenFilterCubit extends Cubit<ChildrenFilterState> {
  ChildrenFilterCubit(this._filterRepository)
      : super(ChildrenFilterInitState());
  final ChildrenFilterRepository _filterRepository;


  fetchFilter() async {
    emit(ChildrenFilterLoadingState());
    try {
      final messages = await _filterRepository.fetchChildren();
      emit(ChildrenFilterSuccessState(children: messages.reversed.toList()));
    } catch (e) {
      emit(ChildrenFilterErrorState('$e'));
    }
  }
}
