import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddDepartmentAreaUseCase extends BaseUseCase<String, AddDepartmentAreaParameters> {
  BaseRepository repository;
  AddDepartmentAreaUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddDepartmentAreaParameters parameters)async {
    return await repository.addDepartmentArea(parameters);
  }
}

class AddDepartmentAreaParameters {
  final String token;
  final Map<String,dynamic> data;

  AddDepartmentAreaParameters(this.token,this.data);
}