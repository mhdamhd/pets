import 'package:pets/features/dogs/domain/entities/dog_entity.dart';
import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/exceptions/http_exception.dart';

abstract class DogsRepository {
  Future<Either<AppException, List<DogEntity>>> fetchDogs(
      {required int limit});
}