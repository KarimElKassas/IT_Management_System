import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddSectorUseCase extends BaseUseCase<String, AddSectorParameters> {
  BaseRepository repository;
  AddSectorUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddSectorParameters parameters)async {
    return await repository.addSector(parameters);
  }
}

class AddSectorParameters {
  final String token;
  final Map<String,dynamic> data;

  AddSectorParameters(this.token,this.data);
}