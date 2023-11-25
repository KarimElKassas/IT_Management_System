import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

  class AddGraphicCardModelUseCase extends BaseUseCase<String, AddGraphicCardModelParameters> {
  BaseRepository repository;
  AddGraphicCardModelUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(AddGraphicCardModelParameters parameters)async {
    return await repository.addGraphicsCardModel(parameters);
  }
}

class AddGraphicCardModelParameters {
  final String token;
  final Map<String,dynamic> data;

  AddGraphicCardModelParameters(this.token,this.data);
}