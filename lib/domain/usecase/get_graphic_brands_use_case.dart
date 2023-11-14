import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class GetGraphicBrandsUseCase extends BaseUseCase<List<GraphicsCardBrandModel>, GetGraphicBrandsParameters> {
  BaseRepository repository;
  GetGraphicBrandsUseCase(this.repository);

  @override
  Future<Either<Failure, List<GraphicsCardBrandModel>>> call(GetGraphicBrandsParameters parameters)async {
    return await repository.getGraphicBrands(parameters);
  }
}

class GetGraphicBrandsParameters {
  final String token;
  GetGraphicBrandsParameters(this.token);
}