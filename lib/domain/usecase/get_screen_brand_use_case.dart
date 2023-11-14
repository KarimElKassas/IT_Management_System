import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/hard_drive_type_model.dart';
import 'package:it_work/data/models/pc_model_device_model.dart';
import 'package:it_work/data/models/ram_type_model.dart';
import 'package:it_work/data/models/screen_brand_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

class GetScreenBrandsUseCase extends BaseUseCase<List<ScreenBrandModel>, GetScreenBrandParameters> {
  BaseRepository repository;
  GetScreenBrandsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ScreenBrandModel>>> call(GetScreenBrandParameters parameters)async {
    return await repository.getScreenBrands(parameters);
  }
}

class GetScreenBrandParameters {
  final String token;
  GetScreenBrandParameters(this.token);
}