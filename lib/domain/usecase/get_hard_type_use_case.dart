import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/hard_drive_type_model.dart';
import 'package:it_work/data/models/ram_type_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class GetHardTypesUseCase extends BaseUseCase<List<HardDriveTypeModel>, GetHardTypesParameters> {
  BaseRepository repository;
  GetHardTypesUseCase(this.repository);

  @override
  Future<Either<Failure, List<HardDriveTypeModel>>> call(GetHardTypesParameters parameters)async {
    return await repository.getHardTypes(parameters);
  }
}

class GetHardTypesParameters {
  final String token;
  GetHardTypesParameters(this.token);
}