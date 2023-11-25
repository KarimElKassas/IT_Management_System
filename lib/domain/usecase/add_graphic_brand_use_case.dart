import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class AddGraphicCardBrandUseCase extends BaseUseCase<String, AddGraphicCardBrandParameters> {
  BaseRepository repository;
  AddGraphicCardBrandUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddGraphicCardBrandParameters parameters)async {
    return await repository.addGraphicsCardBrand(parameters);
  }
}

class AddGraphicCardBrandParameters {
  final String token;
  final Map<String,dynamic> data;

  AddGraphicCardBrandParameters(this.token,this.data);
}