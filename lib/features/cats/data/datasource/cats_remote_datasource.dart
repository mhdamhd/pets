import 'package:pets/configs/app_configs.dart';
import 'package:pets/features/cats/data/models/cat_model.dart';
import 'package:pets/shared/data/remote/remote.dart';
import 'package:pets/shared/globals.dart';

abstract class CatsDatasource {
  Future<List<CatModel>> fetchPaginatedCats(
      {required int skip});
}

class CatsRemoteDatasource extends CatsDatasource {
  final NetworkService networkService;
  CatsRemoteDatasource(this.networkService);

  @override
  Future<List<CatModel>> fetchPaginatedCats(
      {required int skip}) async {
    final response = await networkService.get(
      'https://api.thecatapi.com/v1/images/search',
      queryParameters: {
        'page': skip,
        'limit': ELEMENTS_PER_PAGE,
        'has_breeds' : 'true',
        'order' : 'RANDOM',
      },
      headers: AppConfigs.baseHeaders..addAll(AppConfigs.catsApiHeader)
    );
    final jsonData = response.data;
    var res;
    try {
      res = (jsonData as List).map((e) => CatModel.fromJson(e)).toList();
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }

    return res;
  }
}
