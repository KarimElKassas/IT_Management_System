import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddRamTypeUseCase extends BaseUseCase<String, AddRamTypeParameters> {
  BaseRepository repository;
  AddRamTypeUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddRamTypeParameters parameters)async {
    return await repository.addRamType(parameters);
  }
}

class AddRamTypeParameters {
  final String token;
  final Map<String,dynamic> data;

  AddRamTypeParameters(this.token,this.data);
}