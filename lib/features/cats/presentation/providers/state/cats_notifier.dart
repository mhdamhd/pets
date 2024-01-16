import 'package:pets/features/cats/domain/entities/cat_entity.dart';
import 'package:pets/features/cats/domain/repositories/cats_repository.dart';
import 'package:pets/features/cats/presentation/providers/state/cats_state.dart';
import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/exceptions/http_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CatsNotifier extends StateNotifier<CatsState> {
  final CatsRepository catsRepository;
  final RefreshController refreshController = RefreshController();

  CatsNotifier(
      this.catsRepository,
      ) : super(const CatsState.initial());

  bool get isNotFetching =>
      state.state != CatsConcreteState.loading;

  Future<void> fetchCats() async {
      state = state.copyWith(
        state: CatsConcreteState.loading,
        isLoading: true,
      );

      final response = await catsRepository.fetchCats(
          skip: 0);

      updateStateFromResponse(response);
    refreshController.refreshCompleted();
    refreshController.loadComplete();
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

      final List<CatEntity> totalCats = data;

      state = state.copyWith(
        catList: totalCats,
        state: CatsConcreteState.loaded,
        hasData: true,
        message: totalCats.isEmpty ? 'No cats found' : '',
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const CatsState.initial();
  }
}
