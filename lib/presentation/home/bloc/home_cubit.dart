import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/data/models/area_model.dart';
import 'package:it_work/data/models/department_model.dart';
import 'package:it_work/data/models/sector_model.dart';
import 'package:it_work/domain/usecase/get_areas_use_case.dart';
import 'package:it_work/domain/usecase/get_departments_use_case.dart';
import 'package:it_work/domain/usecase/get_sectors_use_case.dart';
import 'package:it_work/presentation/home/bloc/home_states.dart';
import '../../../utils/prefs_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.getSectorsUseCase,this.getDepartmentsUseCase,this.getAreasUseCase) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  GetSectorsUseCase getSectorsUseCase;
  GetDepartmentsUseCase getDepartmentsUseCase;
  GetAreasUseCase getAreasUseCase;

  List<SectorModel> sectorsList = [];
  SectorModel? selectedSector;

  List<DepartmentModel> departmentList = [];
  DepartmentModel? selectedDepartment;

  List<AreaModel> areasList = [];
  AreaModel? selectedArea;

  void changeSelectedSector(SectorModel? sector){
    selectedSector = sector;
    emit(HomeChangeSelectedSector());
  }
  void changeSelectedDepartment(DepartmentModel? department){
    selectedDepartment = department;
    emit(HomeChangeSelectedDepartment());
  }
  void changeSelectedArea(AreaModel? areaModel){
    selectedArea = areaModel;
    emit(HomeChangeSelectedArea());
  }

  Future<void> getAllSectors() async {
    emit(HomeLoadingSectors());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getSectorsUseCase(GetSectorsParameters(sessionToken));
    result.fold(
            (l) => emit(HomeGetSectorsError(l.errMessage)),
            (r) {
            sectorsList = [];
            sectorsList = r;
            emit(HomeGetSectorsSuccess());
        });
  }
  Future<void> getDepartments(int sectorId) async {
    emit(HomeLoadingDepartments());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getDepartmentsUseCase(GetDepartmentsParameters(sessionToken,sectorId));
    result.fold(
            (l) => emit(HomeGetDepartmentsError(l.errMessage)),
            (r) {
          departmentList = [];
          departmentList = r;
          emit(HomeGetDepartmentsSuccess());
        });
  }
  Future<void> getAreas(int sectorId) async {
    emit(HomeLoadingAreas());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getAreasUseCase(GetAreasParameters(sessionToken,sectorId));
    result.fold(
            (l) => emit(HomeGetAreasError(l.errMessage)),
            (r) {
          areasList = [];
          areasList = r;
          emit(HomeGetAreasSuccess());
        });
  }

  void logOut() async {
    await Preference.prefs.remove('sessionToken');
    await Preference.prefs.remove('User');
    emit(HomeLogOut());
  }
}
