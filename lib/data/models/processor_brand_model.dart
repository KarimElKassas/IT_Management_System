import '../../domain/entities/processor_brand.dart';

class ProcessorBrandModel extends ProcessorBrand{
  ProcessorBrandModel(super.processorBrandId, super.processorBrandName);

  factory ProcessorBrandModel.fromJson(Map<String, dynamic> json){
    return ProcessorBrandModel(
      int.parse(json['pcProcessorBrandId'].toString()),
      json['brand'],
    );
  }

  Map<String, dynamic> toJson() => {
    'pcProcessorBrandId': processorBrandId,
    'brand': processorBrandName,
  };

}