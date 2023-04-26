import 'package:api_provider/my_bloc/cubit/global_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalStateOnBoard(index: 0));

  int _selectedGender = 1;

  int get selectedGender => _selectedGender;

  void changeSelectIndex(int index) {
    emit(GlobalStateOnBoard(index: index));
  }

  void genderChange(int index) {
    _selectedGender = index;
    emit(GenderChangeState(index: index));
  }
}
