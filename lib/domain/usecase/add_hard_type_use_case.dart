import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddHardTypeUseCase extends BaseUseCase<String, AddHardTypeParameters> {
  BaseRepository repository;
  AddHardTypeUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddHardTypeParameters parameters)async {
    return await repository.addHardType(parameters);
  }
}

class AddHardTypeParameters {
  final String token;
  final Map<String,dynamic> data;

  AddHardTypeParameters(this.token,this.data);
}