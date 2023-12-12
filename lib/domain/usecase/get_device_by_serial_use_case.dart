import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/device_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/models/area_model.dart';

class GetDeviceBySerialUseCase extends BaseUseCase<DeviceModel, GetDeviceBySerialParameters> {
  BaseRepository repository;
  GetDeviceBySerialUseCase(this.repository);

  @override
  Future<Either<Failure, DeviceModel>> call(GetDeviceBySerialParameters parameters)async {
    return await repository.getDeviceBySerial(parameters);
  }
}

class GetDeviceBySerialParameters {
  final String token;
  final String serialNumber;

  GetDeviceBySerialParameters(this.token,this.serialNumber);
}