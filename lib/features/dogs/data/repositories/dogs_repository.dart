import 'package:pets/features/dogs/data/datasource/dogs_remote_datasource.dart';
import 'package:pets/features/dogs/domain/entities/dog_entity.dart';
import 'package:pets/features/dogs/domain/repositories/dogs_repository.dart';
import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/exceptions/http_exception.dart';

class DogsRepositoryImpl extends DogsRepository {
  final DogsDatasource dogsDatasource;
  DogsRepositoryImpl(this.dogsDatasource);

  @override
  Future<Either<AppException, List<DogEntity>>> fetchDogs(
      {required int skip}) async {
    try {
      final res = await  dogsDatasource.fetchPaginatedDogs(skip: skip);
      return Right(res.map((e) => e.toEntity()).toList());
    } catch (e, s) {
      return Left(e as AppException);
    }
  }
}
