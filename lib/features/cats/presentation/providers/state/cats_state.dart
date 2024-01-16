// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:pets/features/cats/domain/entities/cat_entity.dart';

enum CatsConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllCats
}

class CatsState extends Equatable {
  final List<CatEntity> catList;
  final int page;
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
    this.page = 0,
  });

  const CatsState.initial({
    this.catList = const [],
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.state = CatsConcreteState.initial,
    this.message = '',
  });

  CatsState copyWith({
    List<CatEntity>? catList,
    int? page,
    bool? hasData,
    CatsConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return CatsState(
      isLoading: isLoading ?? this.isLoading,
      catList: catList ?? this.catList,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'CatsState(isLoading:$isLoading, catLength: ${catList.length}, page: $page, hasData: $hasData, state: $state, message: $message)';
  }

  @override
  List<Object?> get props => [catList, page, hasData, state, message];
}
