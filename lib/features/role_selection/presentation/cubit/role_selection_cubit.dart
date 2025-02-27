import 'package:flutter_bloc/flutter_bloc.dart';

class RoleSelectionCubit extends Cubit<int> {
  RoleSelectionCubit() : super(-1);

  void selectRole(int index) => emit(index);
}
