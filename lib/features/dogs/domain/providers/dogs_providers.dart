import 'package:pets/features/dogs/data/datasource/dogs_remote_datasource.dart';
import 'package:pets/features/dogs/data/repositories/dogs_repository.dart';
import 'package:pets/features/dogs/domain/repositories/dogs_repository.dart';
import 'package:pets/shared/data/remote/network_service.dart';
import 'package:pets/shared/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dogsDatasourceProvider =
Provider.family<DogsDatasource, NetworkService>(
      (_, networkService) => DogsRemoteDatasource(networkService),
);

final dogsRepositoryProvider = Provider<DogsRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  final datasource = ref.watch(dogsDatasourceProvider(networkService));
  final repository = DogsRepositoryImpl(datasource);

  return repository;
});
