import 'package:dartz/dartz.dart';
import 'package:it_work/data/models/sector_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../../data/models/user_model.dart';

class GetSectorsUseCase extends BaseUseCase<List<SectorModel>, GetSectorsParameters> {
  BaseRepository repository;
  GetSectorsUseCase(this.repository);

  @override
  Future<Either<Failure, List<SectorModel>>> call(GetSectorsParameters parameters)async {
    return await repository.getSectors(parameters);
  }
}

class GetSectorsParameters {
  final String data;

  GetSectorsParameters(this.data);
}