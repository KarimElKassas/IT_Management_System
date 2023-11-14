import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/graphics_card_model_device_model.dart';
import 'package:it_work/data/models/processor_model_device_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class GetProcessorModelsUseCase extends BaseUseCase<List<ProcessorModelDeviceModel>, GetProcessorModelsParameters> {
  BaseRepository repository;
  GetProcessorModelsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProcessorModelDeviceModel>>> call(GetProcessorModelsParameters parameters)async {
    return await repository.getProcessorModels(parameters);
  }
}

class GetProcessorModelsParameters {
  final String token;
  final int brandId;
  GetProcessorModelsParameters(this.token,this.brandId);
}