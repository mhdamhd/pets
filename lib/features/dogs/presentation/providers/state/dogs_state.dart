// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:pets/features/dogs/domain/entities/dog_entity.dart';

enum DogsConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllDogs
}

class DogsState extends Equatable {
  final List<DogEntity> dogList;
  final int page;
  final bool hasData;
  final DogsConcreteState state;
  final String message;
  final bool isLoading;
  const DogsState({
    this.dogList = const [],
    this.isLoading = false,
    this.hasData = false,
    this.state = DogsConcreteState.initial,
    this.message = '',
    this.page = 0,
  });

  const DogsState.initial({
    this.dogList = const [],
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = DogsConcreteState.initial,
    this.message = '',
  });

  DogsState copyWith({
    List<DogEntity>? dogList,
    int? page,
    bool? hasData,
    DogsConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return DogsState(
      isLoading: isLoading ?? this.isLoading,
      dogList: dogList ?? this.dogList,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'DogsState(isLoading:$isLoading, dogLength: ${dogList.length}, page: $page, hasData: $hasData, state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [dogList, page, hasData, state, message];
}
