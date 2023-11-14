import 'package:dartz/dartz.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class AddScreenUseCase extends BaseUseCase<String, AddScreenParameters> {
  BaseRepository repository;
  AddScreenUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddScreenParameters parameters)async {
    return await repository.addScreen(parameters);
  }
}

class AddScreenParameters {
  final String token;
  final Map<String,dynamic> data;

  AddScreenParameters(this.token,this.data);
}