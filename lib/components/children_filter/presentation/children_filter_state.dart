import 'package:routus_clean/components/children_filter/data/models/filter_child.dart';

abstract class ChildrenFilterState {}

class ChildrenFilterInitState extends ChildrenFilterState {}

class ChildrenFilterLoadingState extends ChildrenFilterState {}

class ChildrenFilterErrorState extends ChildrenFilterState {
  final String error;

  ChildrenFilterErrorState(this.error);
}

class ChildrenFilterSuccessState extends ChildrenFilterState {
  final List<FilterChild> children;

  ChildrenFilterSuccessState({required this.children});
}
