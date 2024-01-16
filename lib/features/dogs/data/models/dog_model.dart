import 'package:pets/features/dogs/domain/entities/dog_entity.dart';
import 'package:pets/shared/data/models/base_model.dart';

class DogModel extends BaseModel<DogEntity> {
  DogModel({
    required this.width,
    required this.id,
    required this.url,
    required this.breeds,
    required this.height,
  });

  int? width;
  String id;
  String url;
  List<Breed> breeds;
  int? height;

  factory DogModel.fromJson(Map<dynamic, dynamic> json) => DogModel(
        width: json["width"],
        id: json["id"],
        url: json["url"],
        breeds: List<Breed>.from(json["breeds"].map((x) => Breed.fromJson(x))),
        height: json["height"],
      );

  Map<dynamic, dynamic> toJson() => {
        "width": width,
        "id": id,
        "url": url,
        "breeds": List<dynamic>.from(breeds.map((x) => x.toJson())),
        "height": height,
      };

  @override
  DogEntity toEntity() {
    return DogEntity(
      id: id,
      name: breeds.firstOrNull?.name ?? '',
      description: breeds.firstOrNull?.temperament ?? '',
      image: url,
    );
  }
}

class Breed {
  Breed({
    required this.lifeSpan,
    required this.breedGroup,
    required this.temperament,
    required this.name,
    required this.weight,
    required this.bredFor,
    required this.id,
    required this.referenceImageId,
    required this.height,
  });

  String? lifeSpan;
  String? breedGroup;
  String? temperament;
  String? name;
  Eight? weight;
  String? bredFor;
  int? id;
  String? referenceImageId;
  Eight? height;

  factory Breed.fromJson(Map<dynamic, dynamic> json) => Breed(
        lifeSpan: json["life_span"],
        breedGroup: json["breed_group"],
        temperament: json["temperament"],
        name: json["name"],
        weight: json["weight"] == null ? null : Eight.fromJson(json["weight"]),
        bredFor: json["bred_for"],
        id: json["id"],
        referenceImageId: json["reference_image_id"],
        height:json["height"] == null ? null : Eight.fromJson(json["height"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "life_span": lifeSpan,
        "breed_group": breedGroup,
        "temperament": temperament,
        "name": name,
        "weight": weight?.toJson() ?? '',
        "bred_for": bredFor,
        "id": id,
        "reference_image_id": referenceImageId,
        "height": height?.toJson() ?? '',
      };
}

class Eight {
  Eight({
    required this.metric,
    required this.imperial,
  });

  String? metric;
  String? imperial;

  factory Eight.fromJson(Map<dynamic, dynamic> json) => Eight(
        metric: json["metric"],
        imperial: json["imperial"],
      );

  Map<dynamic, dynamic> toJson() => {
        "metric": metric,
        "imperial": imperial,
      };
}
