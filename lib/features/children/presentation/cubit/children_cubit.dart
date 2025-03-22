import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/child_model.dart';
import '../../data/repositories/children_repository.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  final ChildrenRepository repository;
  List<ChildModel> addedChildren = [];

  ChildrenCubit(this.repository) : super(ChildrenInitial());

  Future<void> addChild(String schoolName, String studentId) async {
    emit(ChildrenLoading());
    try {
      final child = await repository.fetchChildProfile(schoolName, studentId);

      if (addedChildren.any((c) => c.id == child.id)) {
        emit(ChildrenError("Child is already added"));
        return;
      }

      addedChildren.add(child);
      emit(ChildrenLoaded(addedChildren));
    } catch (e) {
      emit(ChildrenError("Failed to add child: ${e.toString()}"));
    }
  }

  void deleteChild(int childId) {
    addedChildren.removeWhere((child) => child.id == childId);
    emit(ChildrenLoaded(addedChildren));
  }
}

// 📌 States
abstract class ChildrenState {}

class ChildrenInitial extends ChildrenState {}

class ChildrenLoading extends ChildrenState {}

class ChildrenLoaded extends ChildrenState {
  final List<ChildModel> children;
  ChildrenLoaded(this.children);
}

class ChildrenError extends ChildrenState {
  final String message;
  ChildrenError(this.message);
}
