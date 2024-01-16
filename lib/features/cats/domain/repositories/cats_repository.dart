import 'package:pets/features/cats/domain/entities/cat_entity.dart';
import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/exceptions/http_exception.dart';

abstract class CatsRepository {
  Future<Either<AppException, List<CatEntity>>> fetchCats(
      {required int skip});
}