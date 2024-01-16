import 'package:pets/configs/app_configs.dart';
import 'package:pets/features/dogs/data/models/dog_model.dart';
import 'package:pets/shared/data/remote/remote.dart';
import 'package:pets/shared/globals.dart';

abstract class DogsDatasource {
  Future<List<DogModel>> fetchPaginatedDogs(
      {required int skip});
}

class DogsRemoteDatasource extends DogsDatasource {
  final NetworkService networkService;
  DogsRemoteDatasource(this.networkService);

  @override
  Future<List<DogModel>> fetchPaginatedDogs(
      {required int skip}) async {
    final response = await networkService.get(
      'https://api.thedogapi.com/v1/images/search',
      queryParameters: {
        'page': skip,
        'limit': ELEMENTS_PER_PAGE,
        'has_breeds' : 'true',
        'order' : 'RANDOM',
      },
      headers: AppConfigs.baseHeaders..addAll(AppConfigs.dogsApiHeader),

    );
    final jsonData = response.data;
    var res;
    try {
      res = (jsonData as List).map((e) => DogModel.fromJson(e)).toList();
    } catch (e, s) {
      print(e);
      print(s);
      rethrow;
    }
    return res;
  }
}
