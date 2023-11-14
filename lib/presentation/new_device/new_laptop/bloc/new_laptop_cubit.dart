import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/data/models/area_model.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/graphic_card_size_model.dart';
import 'package:it_work/data/models/graphics_card_brand_model.dart';
import 'package:it_work/data/models/graphics_card_model_device_model.dart';
import 'package:it_work/data/models/hard_drive_size_model.dart';
import 'package:it_work/data/models/hard_drive_type_model.dart';
import 'package:it_work/data/models/pc_model_device_model.dart';
import 'package:it_work/data/models/processor_brand_model.dart';
import 'package:it_work/data/models/processor_core_gen_model.dart';
import 'package:it_work/data/models/processor_model_device_model.dart';
import 'package:it_work/data/models/ram_type_model.dart';
import 'package:it_work/data/models/sector_model.dart';
import 'package:it_work/domain/entities/hard_drive_type.dart';
import 'package:it_work/domain/usecase/get_areas_use_case.dart';
import 'package:it_work/domain/usecase/get_departments_use_case.dart';
import 'package:it_work/domain/usecase/get_sectors_use_case.dart';
import 'package:it_work/presentation/new_device/new_laptop/bloc/new_laptop_states.dart';
import 'package:it_work/resources/strings_manager.dart';
import 'package:it_work/utils/constant.dart';
import 'package:it_work/utils/prefs_helper.dart';

import '../../../../data/models/screen_brand_model.dart';
import '../../../../data/models/screen_size_model.dart';
import '../../../../domain/usecase/add_device_use_case.dart';
import '../../../../domain/usecase/get_graphic_brands_use_case.dart';
import '../../../../domain/usecase/get_graphic_models_use_case.dart';
import '../../../../domain/usecase/get_hard_type_use_case.dart';
import '../../../../domain/usecase/get_pc_model_use_case.dart';
import '../../../../domain/usecase/get_processor_brands_use_case.dart';
import '../../../../domain/usecase/get_processor_gens_use_case.dart';
import '../../../../domain/usecase/get_processor_models_use_case.dart';
import '../../../../domain/usecase/get_ram_type_use_case.dart';

class NewLaptopCubit extends Cubit<NewLaptopStates>{
  NewLaptopCubit(this.getSectorsUseCase,this.getDepartmentsUseCase,this.getAreasUseCase,
      this.getProcessorBrandsUseCase,this.getProcessorModelsUseCase,this.getProcessorGensUseCase,
      this.getGraphicBrandsUseCase,this.getGraphicModelsUseCase,
      this.getRamTypesUseCase,this.getHardTypesUseCase,this.getPcModelUseCase,this.addDeviceUseCase) : super(NewLaptopInit());

  static NewLaptopCubit get(context) => BlocProvider.of(context);

  GetSectorsUseCase getSectorsUseCase;
  GetDepartmentsUseCase getDepartmentsUseCase;
  GetAreasUseCase getAreasUseCase;

  GetProcessorBrandsUseCase getProcessorBrandsUseCase;
  GetProcessorModelsUseCase getProcessorModelsUseCase;
  GetProcessorGensUseCase getProcessorGensUseCase;

  GetGraphicBrandsUseCase getGraphicBrandsUseCase;
  GetGraphicModelsUseCase getGraphicModelsUseCase;

  GetRamTypesUseCase getRamTypesUseCase;
  GetHardTypesUseCase getHardTypesUseCase;
  GetPcModelUseCase getPcModelUseCase;
  AddDeviceUseCase addDeviceUseCase;

  TextEditingController macAddressController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();

  SectorModel? selectedSector;
  DepartmentModel? selectedDepartment;
  AreaModel? selectedArea;

  ProcessorBrandModel? selectedProcessorBrand;
  ProcessorModelDeviceModel? selectedProcessorModel;
  ProcessorCoreGenModel? selectedProcessorCoreGen;

  GraphicsCardBrandModel? selectedGraphicBrand;
  GraphicsCardModelDeviceModel? selectedGraphicModel;
  GraphicCardSizeModel? selectedGraphicSize;

  HardDriveTypeModel? selectedPrimaryHardType;
  HardDriveSizeModel? selectedPrimaryHardSize;

  HardDriveTypeModel? selectedSecondaryHardType;
  HardDriveSizeModel? selectedSecondaryHardSize;

  ScreenBrandModel? selectedPrimaryBrand;
  ScreenSizeModel? selectedPrimarySize;

  ScreenBrandModel? selectedSecondaryBrand;
  ScreenSizeModel? selectedSecondarySize;

  RamTypeModel? selectedRamType;
  GraphicCardSizeModel? selectedRamSize;

  PcModelDeviceModel? selectedDeviceModel;

  List<SectorModel> sectorsList = [];
  List<DepartmentModel> departmentsList = [];
  List<AreaModel> areasList = [];

  List<ProcessorBrandModel> processorBrandList = [];
  List<ProcessorModelDeviceModel> processorModelList = [];
  List<ProcessorCoreGenModel> processorCoreGenList = [];

  List<GraphicsCardBrandModel> graphicBrandsList = [];
  List<GraphicsCardModelDeviceModel> graphicModelList = [];
  List<GraphicCardSizeModel> graphicSizeList = [GraphicCardSizeModel(1, "256 MB"),GraphicCardSizeModel(2, "512 MB"),GraphicCardSizeModel(3, "1 GB"),GraphicCardSizeModel(4, "2 GB"),GraphicCardSizeModel(5, "4 GB"),GraphicCardSizeModel(6, "6 GB"),GraphicCardSizeModel(7, "8 GB"),GraphicCardSizeModel(8, "10 GB"),GraphicCardSizeModel(9, "12 GB"),GraphicCardSizeModel(10, "16 GB")];

  List<HardDriveTypeModel> hardTypeList = [];
  List<HardDriveSizeModel> hardSizeList = [HardDriveSizeModel(1, "128 GB"),HardDriveSizeModel(2, "250 GB"),HardDriveSizeModel(3, "500 GB"),HardDriveSizeModel(4, "750 GB"),HardDriveSizeModel(5, "1 TB"),HardDriveSizeModel(6, "2 TB"),];

  List<ScreenSizeModel> sizeList = [];
  List<ScreenBrandModel> brandsList = [];

  List<RamTypeModel> ramTypeList = [];
  List<GraphicCardSizeModel> ramSizeList = [GraphicCardSizeModel(1, "256 MB"),GraphicCardSizeModel(2, "512 MB"),GraphicCardSizeModel(3, "1 GB"),GraphicCardSizeModel(4, "2 GB"),GraphicCardSizeModel(5, "4 GB"),GraphicCardSizeModel(6, "6 GB"),GraphicCardSizeModel(7, "8 GB"),GraphicCardSizeModel(8, "10 GB"),GraphicCardSizeModel(9, "12 GB"),GraphicCardSizeModel(10, "16 GB"),GraphicCardSizeModel(11, "20 GB"),GraphicCardSizeModel(12, "24 GB"),GraphicCardSizeModel(13, "32 GB"),GraphicCardSizeModel(14, "48 GB"),GraphicCardSizeModel(15, "56 GB"),GraphicCardSizeModel(16, "64 GB"),GraphicCardSizeModel(17, "72 GB")];

  List<PcModelDeviceModel> pcModelList = [];

  bool hasSecondaryHard = false;

  void changeSelectedSector(SectorModel sectorModel){
    if(selectedSector != sectorModel){
      selectedDepartment = null;
      selectedArea = null;
    }
    selectedSector = sectorModel;
    getDepartments(selectedSector!.sectorId);
    getAreas(selectedSector!.sectorId);
    emit(NewLaptopChangeSector());
  }
  void changeSelectedDepartment(DepartmentModel departmentModel){
    selectedDepartment = departmentModel;
    emit(NewLaptopChangeDepartment());
  }
  void changeSelectedArea(AreaModel areaModel){
    selectedArea = areaModel;
    emit(NewLaptopChangeArea());
  }
  void changeSelectedProcessorBrand(ProcessorBrandModel processorBrandModel){
    if(selectedProcessorBrand != processorBrandModel){
      selectedProcessorModel = null;
      selectedProcessorCoreGen = null;
    }
    selectedProcessorBrand = processorBrandModel;
    getProcessorModels(selectedProcessorBrand!.processorBrandId);
    emit(NewLaptopChangeProcessorBrand());
  }
  void changeSelectedProcessorModel(ProcessorModelDeviceModel processorModelDeviceModel){
    selectedProcessorModel = processorModelDeviceModel;
    emit(NewLaptopChangeProcessorModel());
  }
  void changeSelectedProcessorCoreGen(ProcessorCoreGenModel processorCoreGenModel){
    selectedProcessorCoreGen = processorCoreGenModel;
    emit(NewLaptopChangeProcessorGen());
  }
  void changeSelectedGraphicBrand(GraphicsCardBrandModel graphicsCardBrandModel){
    if(selectedGraphicBrand != graphicsCardBrandModel){
      selectedGraphicModel = null;
      selectedGraphicSize = null;
    }
    selectedGraphicBrand = graphicsCardBrandModel;
    getGraphicModels(selectedGraphicBrand!.graphicsCardBrandId);
    emit(NewLaptopChangeGraphicsCardBrand());
  }
  void changeSelectedGraphicModel(GraphicsCardModelDeviceModel graphicsCardModelDeviceModel){
    selectedGraphicModel = graphicsCardModelDeviceModel;
    emit(NewLaptopChangeGraphicsCardModel());
  }
  void changeSelectedGraphicSize(GraphicCardSizeModel graphicCardSizeModel){
    selectedGraphicSize = graphicCardSizeModel;
    emit(NewLaptopChangeGraphicsCardSize());
  }
  void changeSelectedPrimaryHardType(HardDriveTypeModel hardDriveTypeModel){
    selectedPrimaryHardType = hardDriveTypeModel;
    emit(NewLaptopChangeHardType());
  }
  void changeSelectedPrimaryHardSize(HardDriveSizeModel hardDriveSizeModel){
    selectedPrimaryHardSize = hardDriveSizeModel;
    emit(NewLaptopChangeHardSize());
  }
  void changeSelectedSecondaryHardType(HardDriveTypeModel hardDriveTypeModel){
    selectedSecondaryHardType = hardDriveTypeModel;
    emit(NewLaptopChangeHardType());
  }
  void changeSelectedSecondaryHardSize(HardDriveSizeModel hardDriveSizeModel){
    selectedSecondaryHardSize = hardDriveSizeModel;
    emit(NewLaptopChangeHardSize());
  }
  void changeSelectedRamType(RamTypeModel ramTypeModel){
    selectedRamType = ramTypeModel;
    emit(NewLaptopChangeRamModel());
  }
  void changeSelectedRamSize(GraphicCardSizeModel graphicCardSizeModel){
    selectedRamSize = graphicCardSizeModel;
    emit(NewLaptopChangeRamSize());
  }
  void changeSelectedDeviceModel(PcModelDeviceModel pcModelDeviceModel){
    selectedDeviceModel = pcModelDeviceModel;
    emit(NewLaptopChangeDeviceModel());
  }
  void changeSecondaryHard(bool newValue){
    hasSecondaryHard = newValue;
    emit(NewLaptopChangeSecondaryHard());
  }

  Future<void> getAllSectors() async {
    emit(NewLaptopLoadingSectors());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getSectorsUseCase(GetSectorsParameters(sessionToken));
    result.fold(
            (l) => emit(NewLaptopErrorGetSectors(l.errMessage)),
            (r) {
          sectorsList = [];
          sectorsList = r;
          emit(NewLaptopSuccessGetSectors());
        });
  }
  Future<void> getDepartments(int sectorId) async {
    emit(NewLaptopLoadingDepartments());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getDepartmentsUseCase(GetDepartmentsParameters(sessionToken,sectorId));
    result.fold(
            (l) => emit(NewLaptopErrorGetDepartments(l.errMessage)),
            (r) {
          departmentsList = [];
          departmentsList = r;
          emit(NewLaptopSuccessGetDepartments());
        });
  }
  Future<void> getAreas(int sectorId) async {
    emit(NewLaptopLoadingAreas());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getAreasUseCase(GetAreasParameters(sessionToken,sectorId));
    result.fold(
            (l) => emit(NewLaptopErrorGetAreas(l.errMessage)),
            (r) {
          areasList = [];
          areasList = r;
          emit(NewLaptopSuccessGetAreas());
        });
  }

  Future<void> getAllGraphicBrands() async {
    emit(NewLaptopLoadingGraphicsCardBrand());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getGraphicBrandsUseCase(GetGraphicBrandsParameters(sessionToken));
    result.fold(
            (l) => emit(NewLaptopErrorGetGraphicsCardBrand(l.errMessage)),
            (r) {
          graphicBrandsList = [];
          graphicBrandsList = r;
          emit(NewLaptopSuccessGetGraphicsCardBrand());
        });
  }
  Future<void> getGraphicModels(int brandId) async {
    emit(NewLaptopLoadingGraphicsCardModel());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getGraphicModelsUseCase(GetGraphicModelsParameters(sessionToken,brandId));
    result.fold(
            (l) => emit(NewLaptopErrorGetGraphicsCardModel(l.errMessage)),
            (r) {
          graphicModelList = [];
          graphicModelList = r;
          emit(NewLaptopSuccessGetGraphicsCardModel());
        });
  }

  Future<void> getAllProcessorBrands() async {
    emit(NewLaptopLoadingProcessorBrand());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getProcessorBrandsUseCase(GetProcessorBrandsParameters(sessionToken));
    result.fold(
            (l) => emit(NewLaptopErrorGetProcessorBrand(l.errMessage)),
            (r) {
          processorBrandList = [];
          processorBrandList = r;
          emit(NewLaptopSuccessGetProcessorBrand());
        });
  }
  Future<void> getProcessorModels(int brandId) async {
    emit(NewLaptopLoadingProcessorModel());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getProcessorModelsUseCase(GetProcessorModelsParameters(sessionToken,brandId));
    result.fold(
            (l) => emit(NewLaptopErrorGetProcessorModel(l.errMessage)),
            (r) {
          processorModelList = [];
          processorModelList = r;
          emit(NewLaptopSuccessGetProcessorModel());
        });
  }
  Future<void> getProcessorGens() async {
    emit(NewLaptopLoadingProcessorGeneration());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getProcessorGensUseCase(GetProcessorGensParameters(sessionToken));
    result.fold(
            (l) => emit(NewLaptopErrorGetProcessorGeneration(l.errMessage)),
            (r) {
          processorCoreGenList = [];
          processorCoreGenList = r;
          emit(NewLaptopSuccessGetProcessorGeneration());
        });
  }

  Future<void> getAllRamTypes() async {
    emit(NewLaptopLoadingRamModel());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getRamTypesUseCase(GetRamTypesParameters(sessionToken));
    result.fold(
            (l) => emit(NewLaptopErrorGetRamModel(l.errMessage)),
            (r) {
          ramTypeList = [];
          ramTypeList = r;
          emit(NewLaptopSuccessGetRamModel());
        });
  }
  Future<void> getAllHardTypes() async {
    emit(NewLaptopLoadingHardTypes());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getHardTypesUseCase(GetHardTypesParameters(sessionToken));
    result.fold(
            (l) => emit(NewLaptopErrorGetHardTypes(l.errMessage)),
            (r) {
          hardTypeList = [];
          hardTypeList = r;
          emit(NewLaptopSuccessGetHardTypes());
        });
  }
  Future<void> getAllPcModels() async {
    emit(NewLaptopLoadingPcModels());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getPcModelUseCase(GetPcModelParameters(sessionToken));
    result.fold(
            (l) => emit(NewLaptopErrorGetPcModels(l.errMessage)),
            (r) {
          pcModelList = [];
          pcModelList = r;
          emit(NewLaptopSuccessGetPcModels());
        });
  }

  Future<void> addDevice() async {
    emit(NewLaptopLoadingCreateDevice());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String,dynamic> data = {
      "pcDeviceId":0,
      "pcProcessorBrandId": selectedProcessorBrand!.processorBrandId,
      "pcProcessorCoreId" : selectedProcessorModel!.processorModelId,
      "pcProcessorGenerationId" : selectedProcessorCoreGen == null ? 0 : selectedProcessorCoreGen!.processorCoreGenId,
      "graphicsCardBrandId": selectedGraphicBrand!.graphicsCardBrandId,
      "graphicsCardModelId": selectedGraphicModel!.graphicsCardModelDeviceId,
      "pcRamTypeId": selectedRamType!.ramTypeId,
      "ramSize": selectedRamSize!.sizeNumber,
      "primaryHardDriveTypeId": selectedPrimaryHardType!.hardDriveTypeId,
      "primaryHardDriveSize": selectedPrimaryHardSize!.sizeNumber,
      "pcModelId": selectedDeviceModel!.pcModelId,
      "macAddress": macAddressController.text.toString(),
      "serialNumber": serialNumberController.text.toString(),
      "createdBy": Constants.myData().userId,
      "isLabtop": true,
    };

    if(hasSecondaryHard){
      data['secondaryHardDriveTypeId'] = selectedSecondaryHardType!.hardDriveTypeId;
      data['secondaryHardDriveSize'] = selectedSecondaryHardSize!.sizeNumber;
    }
    final result = await addDeviceUseCase(AddDeviceParameters(sessionToken,data));
    result.fold(
            (l) => emit(NewLaptopErrorCreateDevice(l.errMessage)),
            (r) {
          clearTools();
          emit(NewLaptopSuccessCreateDevice());
        });
  }
  String checkValidation(){
    if(selectedSector == null || selectedDepartment == null || selectedArea == null){
      return AppStrings.mainDataRequired;
    }
    if(selectedProcessorBrand == null || selectedProcessorModel == null || (processorCoreGenList.isNotEmpty && selectedProcessorCoreGen == null)){
      return AppStrings.processorDataRequired;
    }
    if(selectedGraphicBrand == null || selectedGraphicModel == null || selectedGraphicSize == null){
      return AppStrings.graphicDataRequired;
    }
    if(selectedRamType == null || selectedRamSize == null){
      return AppStrings.ramDataRequired;
    }
    if(selectedDeviceModel == null){
      return AppStrings.deviceModelRequired;
    }
    if(selectedPrimaryHardType == null || selectedPrimaryHardSize == null){
      return AppStrings.hardDataRequired;
    }
    if(hasSecondaryHard){
      if(selectedSecondaryHardType == null || selectedSecondaryHardSize == null){
        return AppStrings.hardDataRequired;
      }
    }
    if(serialNumberController.text.isEmpty){
      return AppStrings.serialRequired;
    }
    if(macAddressController.text.isEmpty){
      return AppStrings.macRequired;
    }
    return AppStrings.validationSuccess;
  }
  void clearTools(){
    selectedSector = null;
    selectedDepartment = null;
    selectedArea = null;
    selectedProcessorBrand = null;
    selectedProcessorModel = null;
    selectedProcessorCoreGen = null;
    selectedGraphicBrand = null;
    selectedGraphicModel = null;
    selectedGraphicSize = null;
    selectedRamType = null;
    selectedRamSize = null;
    selectedDeviceModel = null;
    selectedPrimaryHardType = null;
    selectedPrimaryHardSize = null;
    hasSecondaryHard = false;
    selectedSecondaryHardType = null;
    selectedSecondaryHardSize = null;
    serialNumberController.clear();
    macAddressController.clear();
  }
}