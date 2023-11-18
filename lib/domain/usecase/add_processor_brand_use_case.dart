import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddProcessorBrandUseCase extends BaseUseCase<String, AddProcessorBrandParameters> {
  BaseRepository repository;
  AddProcessorBrandUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddProcessorBrandParameters parameters)async {
    return await repository.addProcessorBrand(parameters);
  }
}

class AddProcessorBrandParameters {
  final String token;
  final Map<String,dynamic> data;

  AddProcessorBrandParameters(this.token,this.data);
}