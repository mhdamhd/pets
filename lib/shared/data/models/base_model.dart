import 'package:pets/shared/domain/entities/base_entity.dart';

abstract class BaseModel<T extends BaseEntity>{
  T toEntity();
}