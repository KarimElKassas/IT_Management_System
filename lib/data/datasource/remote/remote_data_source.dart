import 'package:dio/dio.dart';
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
import 'package:it_work/domain/usecase/add_device_use_case.dart';
import 'package:it_work/domain/usecase/add_screen_use_case.dart';
import 'package:it_work/domain/usecase/get_departments_use_case.dart';
import 'package:it_work/domain/usecase/get_graphic_brands_use_case.dart';
import 'package:it_work/domain/usecase/get_graphic_models_use_case.dart';
import 'package:it_work/domain/usecase/get_hard_type_use_case.dart';
import 'package:it_work/domain/usecase/get_pc_model_use_case.dart';
import 'package:it_work/domain/usecase/get_processor_brands_use_case.dart';
import 'package:it_work/domain/usecase/get_processor_gens_use_case.dart';
import 'package:it_work/domain/usecase/get_processor_models_use_case.dart';
import 'package:it_work/domain/usecase/get_ram_type_use_case.dart';
import 'package:it_work/domain/usecase/get_screen_brand_use_case.dart';
import 'package:it_work/domain/usecase/get_sectors_use_case.dart';

import '../../../core/error/failure.dart';
import '../../../domain/usecase/get_areas_use_case.dart';
import '../../../domain/usecase/get_user_use_case.dart';
import '../../../domain/usecase/login_user_use_case.dart';
import '../../../resources/endpoints.dart';
import '../../../utils/dio_helper.dart';
import '../../models/user_model.dart';

abstract class BaseRemoteDataSource{
  Future<String> loginUser(LoginUserParameters parameters);
  Future<UserModel> getUser(GetUserParameters parameters);
  Future<List<SectorModel>> getSectors(GetSectorsParameters parameters);
  Future<List<DepartmentModel>> getDepartments(GetDepartmentsParameters parameters);
  Future<List<AreaModel>> getAreas(GetAreasParameters parameters);
  Future<List<ProcessorBrandModel>> getProcessorBrands(GetProcessorBrandsParameters parameters);
  Future<List<ProcessorModelDeviceModel>> getProcessorModels(GetProcessorModelsParameters parameters);
  Future<List<ProcessorCoreGenModel>> getProcessorGens(GetProcessorGensParameters parameters);
  Future<List<GraphicsCardBrandModel>> getGraphicBrands(GetGraphicBrandsParameters parameters);
  Future<List<GraphicsCardModelDeviceModel>> getGraphicModels(GetGraphicModelsParameters parameters);
  Future<List<RamTypeModel>> getRamTypes(GetRamTypesParameters parameters);
  Future<List<HardDriveTypeModel>> getHardTypes(GetHardTypesParameters parameters);
  Future<List<PcModelDeviceModel>> getPcModel(GetPcModelParameters parameters);
  Future<List<ScreenBrandModel>> getScreenBrands(GetScreenBrandParameters parameters);
  Future<String> addDevice(AddDeviceParameters parameters);
  Future<String> addScreen(AddScreenParameters parameters);

}
class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<UserModel> getUser(GetUserParameters parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getMyInfo, options: Options(headers: {
      'Authorization': 'Bearer ${parameters.data}',
      'Content-Type': 'application/json; charset=utf-8'
    }));
    Map<String, dynamic> data = response.data["data"];
    print("DATA MAP : $data");
    data['password'] = parameters.password;
    return UserModel.fromJson(data);
  }

  @override
  Future<String> loginUser(LoginUserParameters parameters)async {
    final response = await DioHelper.postData(url: EndPoints.authenticate, data: parameters.data);
    if(response.data['success'] == true){
      return response.data["data"]["jwtToken"];
    }else{
      throw ServerFailure(response.data['errors'][0].toString());
    }
  }

  @override
  Future<List<DepartmentModel>> getDepartments(GetDepartmentsParameters parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getDepartmentBySectorId,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'sectorId' : parameters.sectorId,
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<DepartmentModel>.from((response.data['data'] as List).map((e) => DepartmentModel.fromJson(e)));
  }

  @override
  Future<List<SectorModel>> getSectors(GetSectorsParameters parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllSectors,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.data}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<SectorModel>.from((response.data['data'] as List).map((e) => SectorModel.fromJson(e)));
  }

  @override
  Future<List<AreaModel>> getAreas(GetAreasParameters parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getAreaBySectorId,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'sectorId' : parameters.sectorId,
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<AreaModel>.from((response.data['data'] as List).map((e) => AreaModel.fromJson(e)));
  }

  @override
  Future<List<GraphicsCardBrandModel>> getGraphicBrands(parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllGraphicBrands,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<GraphicsCardBrandModel>.from((response.data['data'] as List).map((e) => GraphicsCardBrandModel.fromJson(e)));
  }

  @override
  Future<List<GraphicsCardModelDeviceModel>> getGraphicModels(parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getGraphicModelsByBrandId,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'brandId' : parameters.brandId,
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<GraphicsCardModelDeviceModel>.from((response.data['data'] as List).map((e) => GraphicsCardModelDeviceModel.fromJson(e)));
  }

  @override
  Future<List<ProcessorBrandModel>> getProcessorBrands(parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllProcessorBrands,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<ProcessorBrandModel>.from((response.data['data'] as List).map((e) => ProcessorBrandModel.fromJson(e)));
  }

  @override
  Future<List<ProcessorCoreGenModel>> getProcessorGens(parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllProcessorGens,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<ProcessorCoreGenModel>.from((response.data['data'] as List).map((e) => ProcessorCoreGenModel.fromJson(e)));
  }

  @override
  Future<List<ProcessorModelDeviceModel>> getProcessorModels(parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getProcessorCoreByBrandId,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'brandId' : parameters.brandId,
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<ProcessorModelDeviceModel>.from((response.data['data'] as List).map((e) => ProcessorModelDeviceModel.fromJson(e)));
  }

  @override
  Future<List<HardDriveTypeModel>> getHardTypes(GetHardTypesParameters parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllHardTypes,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<HardDriveTypeModel>.from((response.data['data'] as List).map((e) => HardDriveTypeModel.fromJson(e)));

  }

  @override
  Future<List<RamTypeModel>> getRamTypes(GetRamTypesParameters parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllRamTypes,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<RamTypeModel>.from((response.data['data'] as List).map((e) => RamTypeModel.fromJson(e)));
  }

  @override
  Future<List<PcModelDeviceModel>> getPcModel(GetPcModelParameters parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllPcModels,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<PcModelDeviceModel>.from((response.data['data'] as List).map((e) => PcModelDeviceModel.fromJson(e)));
  }

  @override
  Future<String> addDevice(AddDeviceParameters parameters)async {
    final response = await DioHelper.postData(url: EndPoints.createDevice, data: parameters.data,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("RESPONSE : $response");
    if(response.data['success'] == true){
      return response.data["message"];
    }else{
      throw ServerFailure(response.data['errors'][0].toString());
    }
  }

  @override
  Future<String> addScreen(AddScreenParameters parameters)async {
    final response = await DioHelper.postData(url: EndPoints.createScreen, data: parameters.data,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("RESPONSE : $response");
    if(response.data['success'] == true){
      return response.data["message"];
    }else{
      throw ServerFailure(response.data['errors'][0].toString());
    }
  }

  @override
  Future<List<ScreenBrandModel>> getScreenBrands(GetScreenBrandParameters parameters)async {
    final response = await DioHelper.getData(
        url: EndPoints.getAllScreenTypes,
        options: Options(headers: {
          'Authorization': 'Bearer ${parameters.token}',
          'Content-Type': 'application/json; charset=utf-8'
        }));
    print("DATA MAP : ${response.data}");
    return List<ScreenBrandModel>.from((response.data['data'] as List).map((e) => ScreenBrandModel.fromJson(e)));

  }
}