//
import 'package:pets/features/cats/domain/providers/cats_providers.dart';
import 'package:pets/features/cats/presentation/providers/state/cats_notifier.dart';
import 'package:pets/features/cats/presentation/providers/state/cats_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catsNotifierProvider =
StateNotifierProvider<CatsNotifier, CatsState>((ref) {
  final repository = ref.watch(catsRepositoryProvider);
  return CatsNotifier(repository)..fetchCats();
});
