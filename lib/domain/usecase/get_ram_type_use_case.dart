import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/ram_type_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class GetRamTypesUseCase extends BaseUseCase<List<RamTypeModel>, GetRamTypesParameters> {
  BaseRepository repository;
  GetRamTypesUseCase(this.repository);

  @override
  Future<Either<Failure, List<RamTypeModel>>> call(GetRamTypesParameters parameters)async {
    return await repository.getRamTypes(parameters);
  }
}

class GetRamTypesParameters {
  final String token;
  GetRamTypesParameters(this.token);
}