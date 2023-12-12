import '../../domain/entities/device.dart';

class DeviceModel extends Device{
  DeviceModel(super.deviceId, super.processorBrandModelId, super.processorModelDeviceModelId, super.processorCoreGenModelId, super.graphicsCardBrandModelId, super.graphicsCardModelDeviceModelId, super.ramTypeId, super.ramSize, super.primaryHardTypeId, super.secondaryHardTypeId, super.primaryHardSize, super.secondaryHardSize, super.pcModelId, super.macAddress, super.serialNumber, super.isLaptop, super.notes, super.createdBy);

  factory DeviceModel.fromJson(Map<String, dynamic> json){
    Map<String,dynamic> brandMap = json['pcProcessorBrand'];
    Map<String,dynamic> coreMap = json['pcProcessorCore'];
    Map<String,dynamic> genMap = json['pcProcessorGeneration'];
    Map<String,dynamic> graphicBrandMap = json['graphicsCardBrand'];
    Map<String,dynamic> graphicModelMap = json['graphicsCardModel'];
    Map<String,dynamic> ramTypeMap = json['pcRamType'];
    Map<String,dynamic> primaryHardTypeMap = json['primaryHardDriveType'];
    Map<String,dynamic>? secondaryHardTypeMap = json['secondaryHardDriveType'];
    Map<String,dynamic> pcModelMap = json['pcModel'];

    return DeviceModel(
        int.parse(json['pcDeviceId'].toString()),
        int.parse(brandMap['pcProcessorBrandId'].toString()),
        int.parse(coreMap['pcProcessorCoreId'].toString()),
        int.parse(genMap['pcProcessorGenerationId'].toString()),
        int.parse(graphicBrandMap['graphicsCardBrandId'].toString()),
        int.parse(graphicModelMap['graphicsCardModelId'].toString()),
        int.parse(ramTypeMap['pcRamTypeId'].toString()),
        json['ramSize'],
        int.parse(primaryHardTypeMap['hardDriveTypeId'].toString()),
        secondaryHardTypeMap == null ? 0 : int.parse(secondaryHardTypeMap['hardDriveTypeId'].toString()),
        json['primaryHardDriveSize'],
        json['secondaryHardDriveSize'],
        int.parse(pcModelMap['pcModelId'].toString()),
        json['macAddress'],
        json['serialNumber'],
        bool.parse(json['isLabtop'].toString()),
        json['notes'],
        int.parse(json['createdBy'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    'pcDeviceId': deviceId,
    'pcProcessorBrandId': processorBrandModelId,
    'pcProcessorCoreId': processorModelDeviceModelId,
    'pcProcessorGenerationId': processorCoreGenModelId,
    'graphicsCardBrandId': graphicsCardBrandModelId,
    'graphicsCardModelId': graphicsCardModelDeviceModelId,
    'pcRamTypeId': ramTypeId,
    'ramSize': ramSize,
    'primaryHardDriveTypeId': primaryHardTypeId,
    'secondaryHardDriveTypeId': secondaryHardTypeId,
    'primaryHardDriveSize': primaryHardSize,
    'secondaryHardDriveSize': secondaryHardSize,
    'pcModelId': pcModelId,
    'macAddress': macAddress,
    'serialNumber': serialNumber,
    'isLabtop': isLaptop,
    'notes': notes,
    'createdBy': createdBy,
  };
}