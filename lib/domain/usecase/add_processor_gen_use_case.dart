import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddProcessorGenUseCase extends BaseUseCase<String, AddProcessorGenParameters> {
  BaseRepository repository;
  AddProcessorGenUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddProcessorGenParameters parameters)async {
    return await repository.addProcessorGen(parameters);
  }
}

class AddProcessorGenParameters {
  final String token;
  final Map<String,dynamic> data;

  AddProcessorGenParameters(this.token,this.data);
}