import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/seeker_model.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class CreateNewRepairUseCase extends BaseUseCase<String, CreateNewRepairParameters> {
  BaseRepository repository;
  CreateNewRepairUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(CreateNewRepairParameters parameters)async {
    return await repository.createNewRepair(parameters);
  }
}

class CreateNewRepairParameters {
  final String token;
  final Map<String,dynamic> data;

  CreateNewRepairParameters(this.token,this.data);
}