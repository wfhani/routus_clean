import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/child_model.dart';

class ChildProfileCubit extends Cubit<ChildModel> {
  ChildProfileCubit() : super(_mockChild);

  static final _mockChild = ChildModel(
    name: "Nermin Ahmed",
    childId: "242502",
    busId: "543468",
    grade: "3th",
    gender: "Female",
    birthDate: "17/2/2016",
    address: "12 Nasr St, Cairo",
    allergies: "Pollen Allergy: Experiences sneezing and watery eyes during spring",
    immunizations: "All required vaccines are up to date",
    hospitalizations: "Appendectomy (2022): Recovered fully, no complications.",
    emergencyInfo: "Preferred Hospital: City Health Center\nCurrent medications : None",
  );
}
