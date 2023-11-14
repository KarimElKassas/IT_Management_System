import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/processor_brand_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class GetProcessorBrandsUseCase extends BaseUseCase<List<ProcessorBrandModel>, GetProcessorBrandsParameters> {
  BaseRepository repository;
  GetProcessorBrandsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProcessorBrandModel>>> call(GetProcessorBrandsParameters parameters)async {
    return await repository.getProcessorBrands(parameters);
  }
}

class GetProcessorBrandsParameters {
  final String token;
  GetProcessorBrandsParameters(this.token);
}