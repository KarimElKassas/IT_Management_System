import 'package:it_work/domain/entities/department.dart';
import 'package:it_work/domain/entities/hard_drive_type.dart';

class HardDriveTypeModel extends HardDriveType{
  HardDriveTypeModel(super.hardDriveTypeId, super.hardDriveTypeName);


  factory HardDriveTypeModel.fromJson(Map<String, dynamic> json){
    return HardDriveTypeModel(
        int.parse(json['hardDriveTypeId'].toString()),
        json['type'],
    );
  }

  Map<String, dynamic> toJson() => {
    'hardDriveTypeId': hardDriveTypeId,
    'type': hardDriveTypeName,
  };

}