import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_work/data/models/device_model.dart';
import 'package:it_work/data/models/seeker_model.dart';
import 'package:it_work/domain/usecase/get_device_by_serial_use_case.dart';
import 'package:it_work/domain/usecase/search_for_seeker_use_case.dart';
import 'package:it_work/presentation/repair_department/new_repair/bloc/new_repair_states.dart';

import '../../../../domain/usecase/create_new_repair_use_case.dart';
import '../../../../domain/usecase/create_seeker_use_case.dart';
import '../../../../domain/usecase/get_device_department_use_case.dart';
import '../../../../domain/usecase/get_seeker_by_id_use_case.dart';
import '../../../../utils/prefs_helper.dart';

class NewRepairCubit extends Cubit<NewRepairStates>{
  NewRepairCubit(this.searchForSeekerUseCase,this.getSeekerByIdUseCase, this.createSeekerUseCase,
      this.getDeviceBySerialUseCase,this.getDeviceDepartmentUseCase,this.createNewRepairUseCase)
      : super(NewRepairInit());

  SearchForSeekerUseCase searchForSeekerUseCase;
  GetSeekerByIdUseCase getSeekerByIdUseCase;
  CreateSeekerUseCase createSeekerUseCase;
  GetDeviceBySerialUseCase getDeviceBySerialUseCase;
  GetDeviceDepartmentUseCase getDeviceDepartmentUseCase;
  CreateNewRepairUseCase createNewRepairUseCase;

  static NewRepairCubit get(context) => BlocProvider.of(context);

  SeekerModel? currentSeeker;
  DeviceModel? currentDevice;
  String? currentDepartment;
  String? currentArea;

  TextEditingController personIdController = TextEditingController();
  TextEditingController deviceNumberController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController technicalNotesController = TextEditingController();

  int deviceType = 1;
  void changeDeviceType(int newType){
    if(deviceType != newType){
      deviceType = newType;
      emit(NewRepairChangeDeviceTypeState());
    }
  }

  Future<void> searchForSeeker() async {
    emit(NewRepairSearchForSeekerLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await searchForSeekerUseCase(SearchForSeekerParameters(sessionToken,personIdController.text.toString()));
    result.fold(
            (l) => emit(NewRepairSearchForSeekerError(l.errMessage)),
            (r)async => await createSeeker(r.toJson()));
  }

  Future<void> getSeekerById() async {
    emit(NewRepairSearchForSeekerLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getSeekerByIdUseCase(SearchForSeekerParameters(sessionToken,personIdController.text.toString()));
    result.fold(
            (l)async {
              if(l.statusCode != null && l.statusCode == 404){
                await searchForSeeker();
              }else{
                emit(NewRepairSearchForSeekerError(l.errMessage));
              }
            },
            (r) {
          currentSeeker = r;
          emit(NewRepairSearchForSeekerSuccess());
        });
  }

  Future<void> createSeeker(Map<String,dynamic> data) async {
    emit(NewRepairCreateSeekerLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await createSeekerUseCase(CreateSeekerParameters(sessionToken,data));
    result.fold(
            (l) => emit(NewRepairCreateSeekerError(l.errMessage)),
            (r) {
          currentSeeker = r;
          emit(NewRepairCreateSeekerSuccess());
        });
  }

  Future<void> getDeviceBySerial() async {
    emit(NewRepairGetDeviceLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getDeviceBySerialUseCase(GetDeviceBySerialParameters(sessionToken,deviceNumberController.text.toString()));
    result.fold(
            (l) => emit(NewRepairGetDeviceError(l.errMessage)),
            (r) {
              currentDevice = r;
              getDeviceDepartment();
            });
  }

  Future<void> getDeviceDepartment() async {
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    final result = await getDeviceDepartmentUseCase(GetDeviceDepartmentParameters(sessionToken,getDeviceIdFromSerial()));
    result.fold(
            (l) => emit(NewRepairGetDeviceError(l.errMessage)),
            (r) {
              currentArea = r['departmentArea'];
              currentDepartment = r['department'];
          emit(NewRepairGetDeviceSuccess());
        });
  }

  Future<void> createNewRepair(DateTime startDate,DateTime endDate) async {
    emit(NewRepairCreateNewRepairLoading());
    final sessionToken = Preference.prefs.getString("sessionToken")!;
    print("DEVICE ID : ${currentDevice?.deviceId}");
    Map<String,dynamic> data = {
      "statusId": 1,
      "startDateOfWork": DateTime.now().toIso8601String(),
      "maintenanceDescription": technicalNotesController.text.toString(),
      "notes": notesController.text.toString(),
      "seekerInformationId": currentSeeker?.seekerInformationId,
      "pcDeviceId": currentDevice?.deviceId,
      "estimatedDateToStart": startDate.toIso8601String(),
      "estimatedDateToFinish": endDate.toIso8601String()
    };

    final result = await createNewRepairUseCase(CreateNewRepairParameters(sessionToken,data));
    result.fold(
            (l) => emit(NewRepairCreateNewRepairError(l.errMessage)),
            (r) {
              clearTools();
              emit(NewRepairCreateNewRepairSuccess());
            });
  }

  int getDeviceIdFromSerial(){
    List<String> parts = deviceNumberController.text.toString().split('-');
    return int.parse(parts[1].toString());
  }
  void clearTools(){
    currentSeeker = null;
    currentDevice = null;
    currentArea = 'لا يوجد';
    currentDepartment = 'لا يوجد';
    personIdController.clear();
    deviceNumberController.clear();
    technicalNotesController.clear();
    notesController.clear();
  }

}