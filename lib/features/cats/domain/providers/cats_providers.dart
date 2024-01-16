import 'package:pets/features/cats/data/datasource/cats_remote_datasource.dart';
import 'package:pets/features/cats/data/repositories/cats_repository.dart';
import 'package:pets/features/cats/domain/repositories/cats_repository.dart';
import 'package:pets/shared/data/remote/network_service.dart';
import 'package:pets/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catsDatasourceProvider =
Provider.family<CatsDatasource, NetworkService>(
      (_, networkService) => CatsRemoteDatasource(networkService),
);

final catsRepositoryProvider = Provider<CatsRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(catsDatasourceProvider(networkService));
  final repository = CatsRepositoryImpl(datasource);

  return repository;
});
