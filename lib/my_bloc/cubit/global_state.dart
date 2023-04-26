import 'package:equatable/equatable.dart';

class GlobalState extends Equatable {
  const GlobalState();
  @override
  List<Object?> get props => [];
}

class GlobalStateOnBoard extends GlobalState {
  const GlobalStateOnBoard({
    this.index = 0,
  });
  final int index;
  @override
  List<Object> get props => [index];

  GlobalStateOnBoard copyWith({int? index}) {
    return GlobalStateOnBoard(
      index: index ?? this.index,
    );
  }
}

class GenderChangeState extends GlobalState {
  const GenderChangeState({
    this.index = 0,
  });
  final int index;
  @override
  List<Object> get props => [index];

  GenderChangeState copyWith({int? index}) {
    return GenderChangeState(
      index: index ?? this.index,
    );
  }
}

// class BottomNavState extends GlobalState {
//   const BottomNavState({
//     this.bottomIndex = 0,
//   });
//   final int bottomIndex;
//   @override
//   List<Object> get props => [bottomIndex];

//   @override
//   BottomNavState copyWith({int? bottomIndex}) {
//     return BottomNavState(bottomIndex: bottomIndex ?? this.bottomIndex);
//   }
// }
