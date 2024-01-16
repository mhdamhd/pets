import 'package:pets/shared/domain/entities/base_entity.dart';

class CatEntity extends BaseEntity {
  CatEntity({
    required this.id,
    required this.image,
  });

  final String id;
  final String image;

  @override
  List<Object?> get props =>
      [id, image];
}
