import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddDeviceModelUseCase extends BaseUseCase<String, AddDeviceModelParameters> {
  BaseRepository repository;
  AddDeviceModelUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddDeviceModelParameters parameters)async {
    return await repository.addDeviceModel(parameters);
  }
}

class AddDeviceModelParameters {
  final String token;
  final Map<String,dynamic> data;

  AddDeviceModelParameters(this.token,this.data);
}