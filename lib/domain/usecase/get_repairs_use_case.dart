import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/device_maintenance_task_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/models/area_model.dart';

class GetRepairsUseCase extends BaseUseCase<List<DeviceMaintenanceTaskModel>, GetMaintenanceTasksParameters> {
  BaseRepository repository;
  GetRepairsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DeviceMaintenanceTaskModel>>> call(GetMaintenanceTasksParameters parameters)async {
    return await repository.getMaintenanceTasks(parameters);
  }
}

class GetMaintenanceTasksParameters {
  final String token;

  GetMaintenanceTasksParameters(this.token);
}