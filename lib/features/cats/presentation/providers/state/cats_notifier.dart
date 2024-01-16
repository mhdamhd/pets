import 'package:pets/features/cats/domain/entities/cat_entity.dart';
import 'package:pets/features/cats/domain/repositories/cats_repository.dart';
import 'package:pets/features/cats/presentation/providers/state/cats_state.dart';
import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/exceptions/http_exception.dart';
import 'package:pets/shared/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CatsNotifier extends StateNotifier<CatsState> {
  final CatsRepository catsRepository;
  final RefreshController refreshController = RefreshController();

  CatsNotifier(
      this.catsRepository,
      ) : super(const CatsState.initial());

  bool get isNotFetching =>
      state.state != CatsConcreteState.loading &&
          state.state != CatsConcreteState.fetchingMore;

  Future<void> fetchCats() async {
    if (isNotFetching &&
        state.state != CatsConcreteState.fetchedAllCats) {
      state = state.copyWith(
        state: state.page > 0
            ? CatsConcreteState.fetchingMore
            : CatsConcreteState.loading,
        isLoading: true,
      );

      final response = await catsRepository.fetchCats(
          skip: state.page * ELEMENTS_PER_PAGE);

      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: CatsConcreteState.fetchedAllCats,
        message: 'No more cats available',
        isLoading: false,
      );
    }
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }

  Future<void> searchCats(String query) async {
    if (isNotFetching &&
        state.state != CatsConcreteState.fetchedAllCats) {
      state = state.copyWith(
        state: state.page > 0
            ? CatsConcreteState.fetchingMore
            : CatsConcreteState.loading,
        isLoading: true,
      );

      final response = await catsRepository.fetchCats(
        skip: state.page * ELEMENTS_PER_PAGE,
        // query: query,
      );

      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: CatsConcreteState.fetchedAllCats,
        message: 'No more cats available',
        isLoading: false,
      );
    }
  }

  void updateStateFromResponse(
      Either<AppException, List<CatEntity>> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: CatsConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final catList = data;

      final List<CatEntity> totalCats = [...state.catList, ...catList];

      state = state.copyWith(
        catList: totalCats,
        state: catList.length < ELEMENTS_PER_PAGE
            ? CatsConcreteState.fetchedAllCats
            : CatsConcreteState.loaded,
        hasData: true,
        message: totalCats.isEmpty ? 'No cats found' : '',
        page: totalCats.length ~/ ELEMENTS_PER_PAGE,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const CatsState.initial();
  }
}
