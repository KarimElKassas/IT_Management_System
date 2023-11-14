import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class GetDepartmentsUseCase extends BaseUseCase<List<DepartmentModel>, GetDepartmentsParameters> {
  BaseRepository repository;
  GetDepartmentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DepartmentModel>>> call(GetDepartmentsParameters parameters)async {
    return await repository.getDepartments(parameters);
  }
}

class GetDepartmentsParameters {
  final String token;
  final int sectorId;

  GetDepartmentsParameters(this.token,this.sectorId);
}