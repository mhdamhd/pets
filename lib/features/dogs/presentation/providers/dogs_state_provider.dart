//
import 'package:pets/features/dogs/domain/providers/dogs_providers.dart';
import 'package:pets/features/dogs/presentation/providers/state/dogs_notifier.dart';
import 'package:pets/features/dogs/presentation/providers/state/dogs_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dogsNotifierProvider =
StateNotifierProvider<DogsNotifier, DogsState>((ref) {
  final repository = ref.watch(dogsRepositoryProvider);
  return DogsNotifier(repository)..fetchDogs();
});
