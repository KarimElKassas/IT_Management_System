import 'package:it_work/domain/entities/processore_core_generation.dart';

class ProcessorCoreGenModel extends ProcessorCoreGeneration{
  ProcessorCoreGenModel(super.processorCoreGenId, super.processorCoreGenName,super.processorModelId);

  factory ProcessorCoreGenModel.fromJson(Map<String, dynamic> json){
    return ProcessorCoreGenModel(
        int.parse(json['pcProcessorGenerationId'].toString()),
        json['generation'],
        0,
    );
  }

  Map<String, dynamic> toJson() => {
    'pcProcessorGenerationId': processorCoreGenId,
    'generation': processorCoreGenName,
    'modelId': processorModelId,
  };
}