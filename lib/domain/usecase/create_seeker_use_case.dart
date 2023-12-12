import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/seeker_model.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class CreateSeekerUseCase extends BaseUseCase<SeekerModel, CreateSeekerParameters> {
  BaseRepository repository;
  CreateSeekerUseCase(this.repository);

  @override
  Future<Either<Failure, SeekerModel>> call(CreateSeekerParameters parameters)async {
    return await repository.createSeeker(parameters);
  }
}

class CreateSeekerParameters {
  final String token;
  final Map<String,dynamic> data;

  CreateSeekerParameters(this.token,this.data);
}