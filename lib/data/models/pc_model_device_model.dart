import 'package:it_work/domain/entities/department.dart';
import 'package:it_work/domain/entities/pc_model_device.dart';

class PcModelDeviceModel extends PcModelDevice{
  PcModelDeviceModel(super.pcModelId, super.pcModelName);

  factory PcModelDeviceModel.fromJson(Map<String, dynamic> json){
    return PcModelDeviceModel(
        int.parse(json['pcModelId'].toString()),
        json['model'],
    );
  }

  Map<String, dynamic> toJson() => {
    'pcModelId': pcModelId,
    'model': pcModelName,
  };

}