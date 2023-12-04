import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/domain/usecase/add_area_use_case.dart';
import 'package:it_work/domain/usecase/add_graphic_card_mode_use_case.dart';
import 'package:it_work/domain/usecase/add_hard_type_use_case.dart';
import 'package:it_work/domain/usecase/add_processor_brand_use_case.dart';
import 'package:it_work/domain/usecase/get_pc_model_use_case.dart';

import '../../data/models/graphics_card_brand_model.dart';
import '../../data/models/processor_brand_model.dart';
import '../../data/models/processor_model_device_model.dart';
import '../../data/models/sector_model.dart';
import '../../domain/usecase/add_department_use_case.dart';
import '../../domain/usecase/add_device_model_usecase.dart';
import '../../domain/usecase/add_graphic_brand_use_case.dart';
import '../../domain/usecase/add_processor_gen_use_case.dart';
import '../../domain/usecase/add_processor_model_use_case.dart';
import '../../domain/usecase/add_ram_type_usecase.dart';
import '../../domain/usecase/add_sector_use_case.dart';
import '../../domain/usecase/get_graphic_brands_use_case.dart';
import '../../domain/usecase/get_processor_brands_use_case.dart';
import '../../domain/usecase/get_processor_models_use_case.dart';
import '../../domain/usecase/get_sectors_use_case.dart';
import '../../utils/prefs_helper.dart';
import '../new_device/new_computer/bloc/new_computer_states.dart';
import 'new_info_states.dart';

class NewInfoCubit extends Cubit<NewInfoStates> {
  NewInfoCubit(
      this.addSectorUseCase,
      this.getSectorsUseCase,
      this.addAreaUseCase,
      this.addDepartmentUseCase,
      this.addProcessorBrandUseCase,
      this.getProcessorBrandsUseCase,
      this.addProcessorModelUseCase,
      this.addProcessorGenUseCase,
      this.addGraphicCardBrandUseCase,
      this.addGraphicCardModelUseCase,
      this.getGraphicBrandsUseCase,
      this.addRamTypeUseCase, this.addDeviceModelUseCase,this.addHardTypeUseCase)
      : super(NewInfoInit());

  static NewInfoCubit get(context) => BlocProvider.of(context);

  AddSectorUseCase addSectorUseCase;
  GetSectorsUseCase getSectorsUseCase;
  SectorModel? selectedSector;
  List<SectorModel> sectorsList = [];

  AddAreaUseCase addAreaUseCase;

  AddDepartmentUseCase addDepartmentUseCase;

  AddProcessorBrandUseCase addProcessorBrandUseCase;
  GetProcessorBrandsUseCase getProcessorBrandsUseCase;
  ProcessorBrandModel? selectedBrand;
  List<ProcessorBrandModel> brandsList = [];

  AddProcessorModelUseCase addProcessorModelUseCase;

  AddProcessorGenUseCase addProcessorGenUseCase;

  AddGraphicCardBrandUseCase addGraphicCardBrandUseCase;
  GraphicsCardBrandModel? selectedGraphicBrand;
  List<GraphicsCardBrandModel> graphicBrandsList = [];
  GetGraphicBrandsUseCase getGraphicBrandsUseCase;

  AddGraphicCardModelUseCase addGraphicCardModelUseCase;

  AddRamTypeUseCase addRamTypeUseCase;

  AddDeviceModelUseCase addDeviceModelUseCase;
  AddHardTypeUseCase addHardTypeUseCase;

  // Sector Methods
  Future<void> getAllSectors() async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getSectorsUseCase(GetSectorsParameters(sessionToken));
    result.fold((l) => emit(NewInfoGetSectorsError(l.errMessage)), (r) {
      sectorsList = [];
      sectorsList = r;
      emit(NewInfoSuccessGetSectors());
    });
  }

  Future<void> addSector(String newSector) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {"sectorId": 0, "name": newSector};
    final result =
        await addSectorUseCase(AddSectorParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddSectorError(l.errMessage)), (r) {
      emit(NewInfoAddSectorSuccess());
    });
  }

  void changeSelectedSector(SectorModel sectorModel) {
    selectedSector = sectorModel;
    emit(NewInfoChangeSector());
  }

  // Area Methods
  Future<void> addArea(int sectorId, String sectorName, String newArea) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "sectorId": sectorId,
      "name": newArea,
      "areaId": 1
    };
    final result = await addAreaUseCase(AddAreaParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddAreaError(l.errMessage)), (r) {
      emit(
        NewInfoAddAreaSuccess(),
      );
    });
  }

  // Department Methods
  Future<void> addDepartment(String newDepartment) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {"departmentId": 0, "name": newDepartment};
    final result =
        await addDepartmentUseCase(AddDepartmentParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddDepartmentError(l.errMessage)), (r) {
      emit(NewInfoAddDepartmentSuccess());
    });
  }

  // Processor Brand Methods
  Future<void> addProcessorBrand(String newProcessorBrand) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "pcProcessorBrandId": 1,
      "brand": newProcessorBrand
    };
    final result = await addProcessorBrandUseCase(
        AddProcessorBrandParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddProcessorBrandError(l.errMessage)), (r) {
      emit(NewInfoAddProcessorBrandSuccess());
    });
  }

  Future<void> getAllProcessorBrands() async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getProcessorBrandsUseCase(
        GetProcessorBrandsParameters(sessionToken));
    result.fold((l) => emit(NewInfoGetProcessorBrandsError(l.errMessage)), (r) {
      brandsList = [];
      brandsList = r;
      print(brandsList);
      emit(NewInfoSuccessGetProcessorBrands());
    });
  }

  void changeSelectedProcessorBrand(ProcessorBrandModel processorBrandModel) {
    selectedBrand = processorBrandModel;
    emit(NewInfoChangeProcessorBrand());
  }

  // Processor Model Methods
  Future<void> addProcessorModel(
      String newProcessorModel, int processorBrandId) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "pcProcessorBrandId": processorBrandId,
      "core": newProcessorModel,
      "pcProcessorCoreId": 1
    };
    final result = await addProcessorModelUseCase(
        AddProcessorModelParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddProcessorModelError(l.errMessage)), (r) {
      emit(NewInfoAddProcessorModelSuccess());
    });
  }

  // Processor Gen Methods
  Future<void> addProcessorGen(String newProcessorGen) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "pcProcessorGenerationId": 0,
      "generation": newProcessorGen,
    };
    final result = await addProcessorGenUseCase(
        AddProcessorGenParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddProcessorGenError(l.errMessage)), (r) {
      emit(NewInfoAddProcessorGenSuccess());
    });
  }

  //graphic card brand Methods
  Future<void> addGraphicCardBrand(String newGraphicCardBrand) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "graphicsCardBrandId": 1,
      "brand": newGraphicCardBrand,
    };
    final result = await addGraphicCardBrandUseCase(
        AddGraphicCardBrandParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddGraphicCardBrandError(l.errMessage)),
        (r) {
      emit(NewInfoAddGraphicCardBrandSuccess());
    });
  }

  void changeSelectedGraphicBrand(
      GraphicsCardBrandModel graphicsCardBrandModel) {
    selectedGraphicBrand = graphicsCardBrandModel;
    emit(NewInfoChangeGraphicsCardBrand());
  }

  Future<void> getAllGraphicBrands() async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result =
        await getGraphicBrandsUseCase(GetGraphicBrandsParameters(sessionToken));
    result.fold((l) => emit(NewInfoErrorGetGraphicsCardBrand(l.errMessage)),
        (r) {
      graphicBrandsList = [];
      graphicBrandsList = r;
      emit(NewInfoSuccessGetGraphicsCardBrand());
    });
  }

  //graphic card model Methods
  Future<void> addGraphicCardModel(String newGraphicsCardModel,
      String newRamSize, int graphicCardBrandId) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "model": newGraphicsCardModel,
      "graphicsRamSize": newRamSize,
      "pcGraphicsCardBrandId": graphicCardBrandId
    };
    final result = await addGraphicCardModelUseCase(
        AddGraphicCardModelParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddGraphicCardBrandError(l.errMessage)),
        (r) {
      emit(
        NewInfoAddGraphicCardModelSuccess(),
      );
    });
  }

  // Ram Type Methods
  Future<void> addRamType(String newRamType) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "pcRamTypeId": 0,
      "type": newRamType,
    };
    final result =
        await addRamTypeUseCase(AddRamTypeParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddRamTypeError(l.errMessage)), (r) {
      emit(NewInfoAddRamTypeSuccess());
    });
  }

  // PC Model Methods
  Future<void> addDeviceModel(String newDeviceModel) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "pcModelId": 1,
      "model": newDeviceModel,
    };
    final result =
        await addDeviceModelUseCase(AddDeviceModelParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddDeviceModelError(l.errMessage)), (r) {
      emit(NewInfoAddDeviceModelSuccess());
    });
  }
  // hard type methods
  Future<void> addHardType(String newHardType) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "hardDriveTypeId": 1,
      "type": newHardType,
    };
    final result =
    await addHardTypeUseCase(AddHardTypeParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddHardTypeError(l.errMessage)), (r) {
      emit(NewInfoAddHardTypeSuccess());
    });
  }
}
