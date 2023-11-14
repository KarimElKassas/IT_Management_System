import 'package:dartz/dartz.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/models/user_model.dart';

class GetUserUseCase extends BaseUseCase<UserModel, GetUserParameters> {
  BaseRepository repository;
  GetUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(GetUserParameters parameters)async {
    return await repository.getUser(parameters);
  }
}

class GetUserParameters {
  final String data;
  final String password;

  GetUserParameters(this.data,this.password);
}