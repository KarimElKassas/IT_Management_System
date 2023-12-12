import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/seeker_model.dart';
import 'package:it_work/domain/usecase/search_for_seeker_use_case.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class GetSeekerByIdUseCase extends BaseUseCase<SeekerModel, SearchForSeekerParameters> {
  BaseRepository repository;
  GetSeekerByIdUseCase(this.repository);

  @override
  Future<Either<Failure, SeekerModel>> call(SearchForSeekerParameters parameters)async {
    return await repository.getSeekerById(parameters);
  }
}