import 'package:dartz/dartz.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class AddDeviceUseCase extends BaseUseCase<String, AddDeviceParameters> {
  BaseRepository repository;
  AddDeviceUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddDeviceParameters parameters)async {
    return await repository.addDevice(parameters);
  }
}

class AddDeviceParameters {
  final String token;
  final Map<String,dynamic> data;

  AddDeviceParameters(this.token,this.data);
}