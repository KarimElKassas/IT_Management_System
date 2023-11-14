import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/models/area_model.dart';

class GetAreasUseCase extends BaseUseCase<List<AreaModel>, GetAreasParameters> {
  BaseRepository repository;
  GetAreasUseCase(this.repository);

  @override
  Future<Either<Failure, List<AreaModel>>> call(GetAreasParameters parameters)async {
    return await repository.getAreas(parameters);
  }
}

class GetAreasParameters {
  final String token;
  final int sectorId;

  GetAreasParameters(this.token,this.sectorId);
}