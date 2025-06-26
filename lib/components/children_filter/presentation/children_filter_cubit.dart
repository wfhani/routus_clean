import 'package:bloc/bloc.dart';

import 'children_filter_state.dart';

class ChildrenFilterCubit extends Cubit<ChildrenFilterState> {
  ChildrenFilterCubit() : super(ChildrenFilterState().init());
}
