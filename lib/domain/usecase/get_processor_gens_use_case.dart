import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/graphics_card_model_device_model.dart';
import 'package:it_work/data/models/processor_core_gen_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class GetProcessorGensUseCase extends BaseUseCase<List<ProcessorCoreGenModel>, GetProcessorGensParameters> {
  BaseRepository repository;
  GetProcessorGensUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProcessorCoreGenModel>>> call(GetProcessorGensParameters parameters)async {
    return await repository.getProcessorGens(parameters);
  }
}

class GetProcessorGensParameters {
  final String token;
  GetProcessorGensParameters(this.token);
}