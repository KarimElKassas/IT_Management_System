import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddDepartmentUseCase extends BaseUseCase<String, AddDepartmentParameters> {
  BaseRepository repository;
  AddDepartmentUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddDepartmentParameters parameters)async {
    return await repository.addDepartment(parameters);
  }
}

class AddDepartmentParameters {
  final String token;
  final Map<String,dynamic> data;

  AddDepartmentParameters(this.token,this.data);
}