import 'package:equatable/equatable.dart';
import 'package:it_work/data/models/ram_type_model.dart';

class DeviceMaintenanceTask extends Equatable{
  int deviceMaintenanceTaskId;
  int statusId;
  dynamic startDateOfWork;
  dynamic endDateOfWork;
  int createdBy;
  String maintenanceDescription;
  String notes;
  int seekerInformationId;
  int? pcDeviceId;
  int? printerId;
  int? screenId;
  dynamic estimatedTimeToStart;
  dynamic estimatedTimeToFinish;
  dynamic createdAt;
  bool isLaptop;

  DeviceMaintenanceTask(
      this.deviceMaintenanceTaskId,
      this.statusId,
      this.startDateOfWork,
      this.endDateOfWork,
      this.createdBy,
      this.maintenanceDescription,
      this.notes,
      this.seekerInformationId,
      this.pcDeviceId,
      this.printerId,
      this.screenId,
      this.estimatedTimeToStart,
      this.estimatedTimeToFinish,
      this.createdAt,
      this.isLaptop);

  @override
  List<Object?> get props => [
    deviceMaintenanceTaskId,
    statusId,
    startDateOfWork,
    endDateOfWork,
    createdBy,
    maintenanceDescription,
    notes,
    seekerInformationId,
    pcDeviceId,
    printerId,
    screenId,
    estimatedTimeToStart,
    estimatedTimeToFinish,
    createdAt,
    isLaptop
  ];
}