import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/data/models/area_model.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/screen_brand_model.dart';
import 'package:it_work/data/models/sector_model.dart';
import 'package:it_work/domain/usecase/add_screen_use_case.dart';
import 'package:it_work/domain/usecase/get_areas_use_case.dart';
import 'package:it_work/domain/usecase/get_departments_use_case.dart';
import 'package:it_work/domain/usecase/get_screen_brand_use_case.dart';
import 'package:it_work/domain/usecase/get_sectors_use_case.dart';
import 'package:it_work/presentation/new_device/new_pc_screen/bloc/new_pc_screen_states.dart';
import 'package:it_work/resources/strings_manager.dart';
import 'package:it_work/utils/constant.dart';
import 'package:it_work/utils/prefs_helper.dart';

import '../../../../data/models/screen_size_model.dart';

class NewPcScreenCubit extends Cubit<NewPcScreenStates>{
  NewPcScreenCubit(this.getSectorsUseCase,this.getDepartmentsUseCase,this.getAreasUseCase,
      this.getScreenBrandsUseCase,this.addScreenUseCase) : super(NewPcScreenInit());

  static NewPcScreenCubit get(context) => BlocProvider.of(context);

  GetSectorsUseCase getSectorsUseCase;
  GetDepartmentsUseCase getDepartmentsUseCase;
  GetAreasUseCase getAreasUseCase;
  GetScreenBrandsUseCase getScreenBrandsUseCase;
  AddScreenUseCase addScreenUseCase;

  TextEditingController notesController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();

  SectorModel? selectedSector;
  DepartmentModel? selectedDepartment;
  AreaModel? selectedArea;

  ScreenBrandModel? selectedBrand;
  ScreenSizeModel? selectedSize;

  List<SectorModel> sectorsList = [];
  List<DepartmentModel> departmentsList = [];
  List<AreaModel> areasList = [];

  List<ScreenSizeModel> sizeList = [ScreenSizeModel(1, "14 Inch"),ScreenSizeModel(2, "15.6 Inch"),ScreenSizeModel(3, "17 Inch"),ScreenSizeModel(4, "21 Inch"),ScreenSizeModel(5, "27 Inch"),ScreenSizeModel(6, "32 Inch"),ScreenSizeModel(7, "48 Inch")];
  List<ScreenBrandModel> brandsList = [];

  bool isScreenCurved = false;

  void changeSelectedSector(SectorModel sectorModel){
    if(selectedSector != sectorModel){
      selectedDepartment = null;
      selectedArea = null;
    }
    selectedSector = sectorModel;
    getDepartments(selectedSector!.sectorId);
    getAreas(selectedSector!.sectorId);
    emit(NewPcScreenChangeSector());
  }
  void changeSelectedDepartment(DepartmentModel departmentModel){
    selectedDepartment = departmentModel;
    emit(NewPcScreenChangeDepartment());
  }
  void changeSelectedArea(AreaModel areaModel){
    selectedArea = areaModel;
    emit(NewPcScreenChangeArea());
  }
  void changeSelectedBrand(ScreenBrandModel brandModel){
    selectedBrand = brandModel;
    emit(NewPcScreenChangeBrand());
  }
  void changeSelectedSize(ScreenSizeModel sizeModel){
    selectedSize = sizeModel;
    emit(NewPcScreenChangeSize());
  }
  void changeCurved(bool newValue){
    isScreenCurved = newValue;
    emit(NewPcScreenChangeCurved());
  }

  Future<void> getAllSectors() async {
    emit(NewPcScreenLoadingSectors());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getSectorsUseCase(GetSectorsParameters(sessionToken));
    result.fold(
            (l) => emit(NewPcScreenErrorGetSectors(l.errMessage)),
            (r) {
          sectorsList = [];
          sectorsList = r;
          emit(NewPcScreenSuccessGetSectors());
        });
  }
  Future<void> getDepartments(int sectorId) async {
    emit(NewPcScreenLoadingDepartments());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getDepartmentsUseCase(GetDepartmentsParameters(sessionToken,sectorId));
    result.fold(
            (l) => emit(NewPcScreenErrorGetDepartments(l.errMessage)),
            (r) {
          departmentsList = [];
          departmentsList = r;
          emit(NewPcScreenSuccessGetDepartments());
        });
  }
  Future<void> getAreas(int sectorId) async {
    emit(NewPcScreenLoadingAreas());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getAreasUseCase(GetAreasParameters(sessionToken,sectorId));
    result.fold(
            (l) => emit(NewPcScreenErrorGetAreas(l.errMessage)),
            (r) {
          areasList = [];
          areasList = r;
          emit(NewPcScreenSuccessGetAreas());
        });
  }
  Future<void> getAllBrands() async {
    emit(NewPcScreenLoadingBrands());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getScreenBrandsUseCase(GetScreenBrandParameters(sessionToken));
    result.fold(
            (l) => emit(NewPcScreenErrorGetBrands(l.errMessage)),
            (r) {
          brandsList = [];
          brandsList = r;
          emit(NewPcScreenSuccessGetBrands());
        });
  }


  Future<void> addDevice() async {
    emit(NewPcScreenLoadingCreateScreen());
    final sessionToken = Preference.prefs.getString("sessionToken")!;

    Map<String,dynamic> data = {
      "pcScreenId":0,
      "pcScreenTypeId": selectedBrand!.screenBrandId,
      "isScreenCarved" : isScreenCurved,
      "screenSize" : selectedSize!.sizeNumber,
      "notes": notesController.text.toString(),
      "serialNumber": serialNumberController.text.toString(),
    };

    final result = await addScreenUseCase(AddScreenParameters(sessionToken,data));
    result.fold(
            (l) => emit(NewPcScreenErrorCreateScreen(l.errMessage)),
            (r) {
          clearTools();
          emit(NewPcScreenSuccessCreateScreen());
        });
  }

  String checkValidation(){
    if(selectedSector == null || selectedDepartment == null || selectedArea == null){
      return AppStrings.mainDataRequired;
    }
    if(selectedBrand == null || selectedSize == null){
      return AppStrings.processorDataRequired;
    }
    if(serialNumberController.text.isEmpty){
      return AppStrings.serialRequired;
    }
    return AppStrings.validationSuccess;
  }
  void clearTools(){
    selectedSector = null;
    selectedDepartment = null;
    selectedArea = null;
    selectedBrand = null;
    selectedSize = null;
    isScreenCurved = false;
    serialNumberController.clear();
    notesController.clear();
  }
}