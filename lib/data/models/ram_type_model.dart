import 'package:it_work/domain/entities/department.dart';
import 'package:it_work/domain/entities/ram_type.dart';

class RamTypeModel extends RamType{
  RamTypeModel(super.ramTypeId, super.ramTypeName);

  factory RamTypeModel.fromJson(Map<String, dynamic> json){
    return RamTypeModel(
        int.parse(json['pcRamTypeId'].toString()),
        json['type'],
    );
  }

  Map<String, dynamic> toJson() => {
    'pcRamTypeId': ramTypeId,
    'type': ramTypeName,
  };
}