import 'package:pets/features/dogs/domain/entities/dog_entity.dart';
import 'package:pets/features/dogs/domain/repositories/dogs_repository.dart';
import 'package:pets/features/dogs/presentation/providers/state/dogs_state.dart';
import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/exceptions/http_exception.dart';
import 'package:pets/shared/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DogsNotifier extends StateNotifier<DogsState> {
  final DogsRepository dogsRepository;

  DogsNotifier(
      this.dogsRepository,
      ) : super(const DogsState.initial());

  bool get isNotFetching =>
      state.state != DogsConcreteState.loading;

  Future<void> fetchDogs() async {
      state = state.copyWith(
        state: DogsConcreteState.loading,
        isLoading: true,
        oneItem: !state.oneItem
      );

      final response = await dogsRepository.fetchDogs(
          limit: state.oneItem ? 1 : ELEMENTS_PER_PAGE );

      updateStateFromResponse(response);
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

      final List<DogEntity> totalDogs = data;

      state = state.copyWith(
        dogList: totalDogs,
        state: DogsConcreteState.loaded,
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
