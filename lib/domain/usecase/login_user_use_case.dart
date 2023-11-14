import 'package:dartz/dartz.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class LoginUserUseCase extends BaseUseCase<String, LoginUserParameters> {
  BaseRepository repository;
  LoginUserUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginUserParameters parameters)async {
    return await repository.loginUser(parameters);
  }
}

class LoginUserParameters {
  final Map<String,dynamic> data;

  LoginUserParameters(this.data);
}