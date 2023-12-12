import 'package:it_work/domain/entities/area.dart';
import 'package:it_work/domain/entities/device_maintenance_task.dart';

import '../../domain/entities/device.dart';

class DeviceMaintenanceTaskModel extends DeviceMaintenanceTask{
  DeviceMaintenanceTaskModel(super.deviceMaintenanceTaskId,this.serialNumber, super.statusId, super.startDateOfWork,
      super.endDateOfWork, super.createdBy, super.maintenanceDescription, super.notes, super.seekerInformationId,
      super.pcDeviceId, super.printerId, super.screenId, super.estimatedTimeToStart, super.estimatedTimeToFinish, super.createdAt,super.isLaptop);

  final String serialNumber;

  factory DeviceMaintenanceTaskModel.fromJson(Map<String, dynamic> json){
    Map<String,dynamic> pcDeviceMap = json['pcDevice'];
    print("MAP : ${pcDeviceMap['deviceMaintenanceTasks'][0].runtimeType}");
    Map<String,dynamic> statusMap = pcDeviceMap['deviceMaintenanceTasks'][0];

    return DeviceMaintenanceTaskModel(
        int.parse(json['deviceMaintenanceTaskId'].toString()),
        pcDeviceMap['serialNumber'],
        int.parse(statusMap['statusId'].toString()),
        statusMap['startDateOfWork'],
        statusMap['endDateOfWork'],
        int.parse(statusMap['createdBy'].toString()),
        statusMap['maintenanceDescription'],
        statusMap['notes'],
        int.parse(statusMap['seekerInformationId'].toString()),
        statusMap['pcDeviceId'] == null ? 0 : int.parse(statusMap['pcDeviceId'].toString()),
        statusMap['printerId'] == null ? 0 : int.parse(statusMap['printerId'].toString()),
        statusMap['pcScreenId'] == null ? 0 : int.parse(statusMap['pcScreenId'].toString()),
        statusMap['estimatedDateToStart'],
        statusMap['estimatedDateToFinish'],
        statusMap['createdAt'],
        pcDeviceMap['isLabtop']
    );
  }

  Map<String, dynamic> toJson() => {
    'deviceMaintenanceTaskId': deviceMaintenanceTaskId,
    'statusId': statusId,
    'startDateOfWork': startDateOfWork,
    'endDateOfWork': endDateOfWork,
    'createdBy': createdBy,
    'maintenanceDescription': maintenanceDescription,
    'notes': notes,
    'seekerInformationId': seekerInformationId,
    'pcDeviceId': pcDeviceId,
    'printerId': printerId,
    'pcScreenId': screenId,
    'estimatedDateToStart': estimatedTimeToStart,
    'estimatedDateToFinish': estimatedTimeToFinish,
    'createdAt': createdAt,
    'isLabtop' : isLaptop
  };
}