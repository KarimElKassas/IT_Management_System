import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/seeker_model.dart';

import '../../core/error/failure.dart';
import '../../core/use_case/base_use_case.dart';
import '../repository/base_repository.dart';

class SearchForSeekerUseCase extends BaseUseCase<SeekerModel, SearchForSeekerParameters> {
  BaseRepository repository;
  SearchForSeekerUseCase(this.repository);

  @override
  Future<Either<Failure, SeekerModel>> call(SearchForSeekerParameters parameters)async {
    return await repository.searchForSeeker(parameters);
  }
}

class SearchForSeekerParameters {
  final String token;
  final String personId;

  SearchForSeekerParameters(this.token,this.personId);
}