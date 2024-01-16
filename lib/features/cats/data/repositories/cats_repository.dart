import 'package:pets/features/cats/data/datasource/cats_remote_datasource.dart';
import 'package:pets/features/cats/domain/entities/cat_entity.dart';
import 'package:pets/features/cats/domain/repositories/cats_repository.dart';
import 'package:pets/shared/domain/models/either.dart';
import 'package:pets/shared/exceptions/http_exception.dart';

class CatsRepositoryImpl extends CatsRepository {
  final CatsDatasource catsDatasource;
  CatsRepositoryImpl(this.catsDatasource);

  @override
  Future<Either<AppException, List<CatEntity>>> fetchCats(
      {required int skip}) async {
    try {
      final res = await  catsDatasource.fetchPaginatedCats(skip: skip);
      return Right(res.map((e) => e.toEntity()).toList());
    } catch (e, s) {
      return Left(e as AppException);
    }
  }
}
