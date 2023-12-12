import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/models/area_model.dart';

class GetAllAreasUseCase extends BaseUseCase<List<AreaModel>, GetAllAreasParameters> {
  BaseRepository repository;
  GetAllAreasUseCase(this.repository);

  @override
  Future<Either<Failure, List<AreaModel>>> call(GetAllAreasParameters parameters)async {
    return await repository.getAllAreas(parameters);
  }
}

class GetAllAreasParameters {
  final String token;

  GetAllAreasParameters(this.token);
}