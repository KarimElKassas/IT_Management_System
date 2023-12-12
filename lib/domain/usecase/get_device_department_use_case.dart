import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/device_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/models/area_model.dart';

class GetDeviceDepartmentUseCase extends BaseUseCase<Map<String,dynamic>, GetDeviceDepartmentParameters> {
  BaseRepository repository;
  GetDeviceDepartmentUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String,dynamic>>> call(GetDeviceDepartmentParameters parameters)async {
    return await repository.getDeviceDepartment(parameters);
  }
}

class GetDeviceDepartmentParameters {
  final String token;
  final int deviceId;

  GetDeviceDepartmentParameters(this.token,this.deviceId);
}