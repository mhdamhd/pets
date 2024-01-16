// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:pets/features/cats/domain/entities/cat_entity.dart';

enum CatsConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

class CatsState extends Equatable {
  final List<CatEntity> catList;
  final bool hasData;
  final CatsConcreteState state;
  final String message;
  final bool isLoading;
  const CatsState({
    this.catList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = CatsConcreteState.initial,
    this.message = '',
  });

  const CatsState.initial({
    this.catList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = CatsConcreteState.initial,
    this.message = '',
  });

  CatsState copyWith({
    List<CatEntity>? catList,
    bool? hasData,
    CatsConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return CatsState(
      isLoading: isLoading ?? this.isLoading,
      catList: catList ?? this.catList,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'CatsState(isLoading:$isLoading, catLength: ${catList.length}, hasData: $hasData, state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [catList, hasData, state, message];
}
