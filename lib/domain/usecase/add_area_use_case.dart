import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddAreaUseCase extends BaseUseCase<String, AddAreaParameters> {
  BaseRepository repository;
  AddAreaUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddAreaParameters parameters)async {
    return await repository.addArea(parameters);
  }
}

class AddAreaParameters {
  final String token;
  final Map<String,dynamic> data;

  AddAreaParameters(this.token,this.data);
}