import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/domain/usecase/add_area_use_case.dart';
import 'package:it_work/domain/usecase/add_processor_brand_use_case.dart';
import 'package:it_work/domain/usecase/get_pc_model_use_case.dart';

import '../../data/models/processor_brand_model.dart';
import '../../data/models/processor_model_device_model.dart';
import '../../data/models/sector_model.dart';
import '../../domain/usecase/add_department_use_case.dart';
import '../../domain/usecase/add_processor_model_use_case.dart';
import '../../domain/usecase/add_sector_use_case.dart';
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
      this.addProcessorBrandUseCase, this.getProcessorBrandsUseCase, this.addProcessorModelUseCase)
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
    final result =
        await addProcessorBrandUseCase(AddProcessorBrandParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddProcessorBrandError(l.errMessage)), (r) {
      emit(NewInfoAddProcessorBrandSuccess());
    });
  }

  Future<void> getAllProcessorBrands() async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getProcessorBrandsUseCase(GetProcessorBrandsParameters(sessionToken));
    result.fold(
            (l) => emit(NewInfoGetProcessorBrandsError(l.errMessage)),
            (r) {
          brandsList = [];
          brandsList = r;
          print(brandsList);
      emit(NewInfoSuccessGetProcessorBrands());
        });
  }

  void changeSelectedProcessorBrand(ProcessorBrandModel processorBrandModel){
    selectedBrand = processorBrandModel;
    emit(NewInfoChangeProcessorBrand());
  }

  // Processor Model Methods
  Future<void> addProcessorModel(String newProcessorModel, int processorBrandId) async {
    emit(NewInfoLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String, dynamic> data = {
      "pcProcessorBrandId": processorBrandId,
      "core": newProcessorModel,
      "pcProcessorCoreId": 1
    };
    final result =
    await addProcessorModelUseCase(AddProcessorModelParameters(sessionToken, data));
    result.fold((l) => emit(NewInfoAddProcessorModelError(l.errMessage)), (r) {
      emit(NewInfoAddProcessorModelSuccess());
    });
  }
}
