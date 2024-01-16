import 'package:pets/shared/domain/entities/base_entity.dart';

class DogEntity extends BaseEntity {
  DogEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  final String id;
  final String name;
  final String description;
  final String image;

  @override
  List<Object?> get props =>
      [id, name, description, image];
}
