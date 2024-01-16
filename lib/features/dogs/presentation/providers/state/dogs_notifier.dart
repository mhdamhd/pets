import 'package:pets/features/dogs/domain/entities/dog_entity.dart';
import 'package:pets/features/dogs/domain/repositories/dogs_repository.dart';
import 'package:pets/features/dogs/presentation/providers/state/dogs_state.dart';
import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/exceptions/http_exception.dart';
import 'package:pets/shared/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DogsNotifier extends StateNotifier<DogsState> {
  final DogsRepository dogsRepository;
  final RefreshController refreshController = RefreshController();

  DogsNotifier(
      this.dogsRepository,
      ) : super(const DogsState.initial());

  bool get isNotFetching =>
      state.state != DogsConcreteState.loading &&
          state.state != DogsConcreteState.fetchingMore;

  Future<void> fetchDogs() async {
    if (isNotFetching &&
        state.state != DogsConcreteState.fetchedAllDogs) {
      state = state.copyWith(
        state: state.page > 0
            ? DogsConcreteState.fetchingMore
            : DogsConcreteState.loading,
        isLoading: true,
      );

      final response = await dogsRepository.fetchDogs(
          skip: state.page * ELEMENTS_PER_PAGE);

      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: DogsConcreteState.fetchedAllDogs,
        message: 'No more dogs available',
        isLoading: false,
      );
    }
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }

  Future<void> searchDogs(String query) async {
    if (isNotFetching &&
        state.state != DogsConcreteState.fetchedAllDogs) {
      state = state.copyWith(
        state: state.page > 0
            ? DogsConcreteState.fetchingMore
            : DogsConcreteState.loading,
        isLoading: true,
      );

      final response = await dogsRepository.fetchDogs(
        skip: state.page * ELEMENTS_PER_PAGE,
        // query: query,
      );

      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: DogsConcreteState.fetchedAllDogs,
        message: 'No more dogs available',
        isLoading: false,
      );
    }
  }

  void updateStateFromResponse(
      Either<AppException, List<DogEntity>> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: DogsConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final dogList = data;

      final List<DogEntity> totalDogs = [...state.dogList, ...dogList];

      state = state.copyWith(
        dogList: totalDogs,
        state: dogList.length < ELEMENTS_PER_PAGE
            ? DogsConcreteState.fetchedAllDogs
            : DogsConcreteState.loaded,
        hasData: true,
        message: totalDogs.isEmpty ? 'No dogs found' : '',
        page: totalDogs.length ~/ ELEMENTS_PER_PAGE,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const DogsState.initial();
  }
}
