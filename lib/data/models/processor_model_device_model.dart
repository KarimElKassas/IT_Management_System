import '../../domain/entities/processor_model_device.dart';

class ProcessorModelDeviceModel extends ProcessorModelDevice{
  ProcessorModelDeviceModel(super.processorModelId, super.processorModelName,super.processorBrandId);

  factory ProcessorModelDeviceModel.fromJson(Map<String, dynamic> json){
    return ProcessorModelDeviceModel(
      int.parse(json['pcProcessorCoreId'].toString()),
      json['core'],
      int.parse(json['pcProcessorBrandId'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    'pcProcessorCoreId': processorModelId,
    'core': processorModelName,
    'pcProcessorBrandId': processorBrandId,
  };

}