import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:it_work/data/datasource/remote/remote_data_source.dart';
import 'package:it_work/data/models/area_model.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/graphics_card_model_device_model.dart';
import 'package:it_work/data/models/hard_drive_type_model.dart';
import 'package:it_work/data/models/pc_model_device_model.dart';
import 'package:it_work/data/models/processor_brand_model.dart';
import 'package:it_work/data/models/processor_core_gen_model.dart';
import 'package:it_work/data/models/processor_model_device_model.dart';
import 'package:it_work/data/models/ram_type_model.dart';
import 'package:it_work/data/models/screen_brand_model.dart';
import 'package:it_work/data/models/sector_model.dart';
import 'package:it_work/domain/repository/base_repository.dart';
import 'package:it_work/domain/usecase/add_device_use_case.dart';
import 'package:it_work/domain/usecase/add_graphic_brand_use_case.dart';
import 'package:it_work/domain/usecase/add_processor_brand_use_case.dart';
import 'package:it_work/domain/usecase/add_processor_model_use_case.dart';
import 'package:it_work/domain/usecase/add_screen_use_case.dart';
import 'package:it_work/domain/usecase/get_areas_use_case.dart';
import 'package:it_work/domain/usecase/get_departments_use_case.dart';
import 'package:it_work/domain/usecase/get_hard_type_use_case.dart';
import 'package:it_work/domain/usecase/get_pc_model_use_case.dart';
import 'package:it_work/domain/usecase/get_ram_type_use_case.dart';
import 'package:it_work/domain/usecase/get_screen_brand_use_case.dart';
import 'package:it_work/domain/usecase/get_sectors_use_case.dart';

import '../../core/error/failure.dart';
import '../../domain/usecase/add_area_use_case.dart';
import '../../domain/usecase/add_department_use_case.dart';
import '../../domain/usecase/add_graphic_card_mode_use_case.dart';
import '../../domain/usecase/add_processor_gen_use_case.dart';
import '../../domain/usecase/add_sector_use_case.dart';
import '../../domain/usecase/get_user_use_case.dart';
import '../../domain/usecase/login_user_use_case.dart';
import '../models/user_model.dart';

class ITRepository extends BaseRepository{
  BaseRemoteDataSource remoteDataSource;
  ITRepository(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> loginUser(LoginUserParameters parameters)async {
    try{
      final result = await remoteDataSource.loginUser(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser(GetUserParameters parameters)async {

    try{
      final result = await remoteDataSource.getUser(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, List<DepartmentModel>>> getDepartments(GetDepartmentsParameters parameters)async {
    try{
      final result = await remoteDataSource.getDepartments(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }

  }

  @override
  Future<Either<Failure, List<SectorModel>>> getSectors(GetSectorsParameters parameters)async {
    try{
      final result = await remoteDataSource.getSectors(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }

  }

  @override
  Future<Either<Failure, List<AreaModel>>> getAreas(GetAreasParameters parameters)async {
    try{
      final result = await remoteDataSource.getAreas(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure,List<GraphicsCardBrandModel>>> getGraphicBrands(parameters)async {
    try{
      final result = await remoteDataSource.getGraphicBrands(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure,List<GraphicsCardModelDeviceModel>>> getGraphicModels(parameters)async {
    try{
      final result = await remoteDataSource.getGraphicModels(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure,List<ProcessorBrandModel>>> getProcessorBrands(parameters)async {
    try{
      final result = await remoteDataSource.getProcessorBrands(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure,List<ProcessorCoreGenModel>>> getProcessorGens(parameters)async {
    try{
      final result = await remoteDataSource.getProcessorGens(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure,List<ProcessorModelDeviceModel>>> getProcessorModels(parameters)async {
    try{
      final result = await remoteDataSource.getProcessorModels(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, List<HardDriveTypeModel>>> getHardTypes(GetHardTypesParameters parameters)async {
    try{
      final result = await remoteDataSource.getHardTypes(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }

  }

  @override
  Future<Either<Failure, List<RamTypeModel>>> getRamTypes(GetRamTypesParameters parameters)async {
    try{
      final result = await remoteDataSource.getRamTypes(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, List<PcModelDeviceModel>>> getPcModel(GetPcModelParameters parameters)async {
    try{
      final result = await remoteDataSource.getPcModel(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, String>> addDevice(AddDeviceParameters parameters)async {
    try{
      final result = await remoteDataSource.addDevice(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, String>> addScreen(AddScreenParameters parameters)async {
    try{
      final result = await remoteDataSource.addScreen(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, List<ScreenBrandModel>>> getScreenBrands(GetScreenBrandParameters parameters)async {
    try{
      final result = await remoteDataSource.getScreenBrands(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }

  }

  @override
  Future<Either<Failure, String>> addSector(AddSectorParameters parameters) async {
    try{
      final result = await remoteDataSource.addSector(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, String>> addArea(AddAreaParameters parameters) async {
    try{
      final result = await remoteDataSource.addArea(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, String>> addDepartment(AddDepartmentParameters parameters) async {
    try{
      final result = await remoteDataSource.addDepartment(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, String>> addProcessorBrand(AddProcessorBrandParameters parameters) async {
    try{
      final result = await remoteDataSource.addProcessorBrand(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, String>> addProcessorModel(AddProcessorModelParameters parameters) async {
    try{
      final result = await remoteDataSource.addProcessorModel(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, String>> addProcessorGen(AddProcessorGenParameters parameters) async {
    try{
      final result = await remoteDataSource.addProcessorGen(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, String>> addGraphicsCardBrand(AddGraphicCardBrandParameters parameters) async{
    try{
      final result = await remoteDataSource.addGraphicCardBrand(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, String>> addGraphicsCardModel(AddGraphicCardModelParameters parameters) async{
    try{
      final result = await remoteDataSource.addGraphicCardModel(parameters);
      return Right(result);
    }catch (e){
      if (e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(e as ServerFailure);
    }
  }

}