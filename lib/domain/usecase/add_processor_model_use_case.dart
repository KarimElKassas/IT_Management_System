import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddProcessorModelUseCase extends BaseUseCase<String, AddProcessorModelParameters> {
  BaseRepository repository;
  AddProcessorModelUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddProcessorModelParameters parameters)async {
    return await repository.addProcessorModel(parameters);
  }
}

class AddProcessorModelParameters {
  final String token;
  final Map<String,dynamic> data;

  AddProcessorModelParameters(this.token,this.data);
}