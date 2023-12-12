import 'package:equatable/equatable.dart';
import 'package:it_work/data/models/ram_type_model.dart';

class Device extends Equatable{
  int deviceId;
  int processorBrandModelId;
  int processorModelDeviceModelId;
  int processorCoreGenModelId;
  int graphicsCardBrandModelId;
  int graphicsCardModelDeviceModelId;
  int ramTypeId;
  String? ramSize;
  int primaryHardTypeId;
  int? secondaryHardTypeId;
  String primaryHardSize;
  String? secondaryHardSize;
  int pcModelId;
  String? macAddress;
  String serialNumber;
  bool isLaptop;
  String? notes;
  int createdBy;


  Device(
      this.deviceId,
      this.processorBrandModelId,
      this.processorModelDeviceModelId,
      this.processorCoreGenModelId,
      this.graphicsCardBrandModelId,
      this.graphicsCardModelDeviceModelId,
      this.ramTypeId,
      this.ramSize,
      this.primaryHardTypeId,
      this.secondaryHardTypeId,
      this.primaryHardSize,
      this.secondaryHardSize,
      this.pcModelId,
      this.macAddress,
      this.serialNumber,
      this.isLaptop,
      this.notes,
      this.createdBy);

  @override
  List<Object?> get props => [deviceId,processorBrandModelId,processorModelDeviceModelId,processorCoreGenModelId,
    graphicsCardBrandModelId,graphicsCardModelDeviceModelId,ramTypeId,ramSize,
    primaryHardTypeId,
    secondaryHardTypeId,
    primaryHardSize,
    secondaryHardSize,
    pcModelId,
    macAddress,
    serialNumber,
    isLaptop,
    notes,
    createdBy];
}