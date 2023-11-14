import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/graphics_card_model_device_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class GetGraphicModelsUseCase extends BaseUseCase<List<GraphicsCardModelDeviceModel>, GetGraphicModelsParameters> {
  BaseRepository repository;
  GetGraphicModelsUseCase(this.repository);

  @override
  Future<Either<Failure, List<GraphicsCardModelDeviceModel>>> call(GetGraphicModelsParameters parameters)async {
    return await repository.getGraphicModels(parameters);
  }
}

class GetGraphicModelsParameters {
  final String token;
  final int brandId;
  GetGraphicModelsParameters(this.token,this.brandId);
}