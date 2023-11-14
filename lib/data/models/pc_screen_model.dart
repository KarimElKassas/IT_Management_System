import 'package:it_work/domain/entities/department.dart';
import 'package:it_work/domain/entities/pc_screen.dart';

class PcScreenModel extends PcScreen{
  PcScreenModel(super.pcScreenId,
      super.screenBrandId,
      super.isScreenCurved,
      super.screenSize,
      super.notes,
      super.serialNumber,
      super.startDate,
      super.endDate,
      super.createdBy);

  factory PcScreenModel.fromJson(Map<String, dynamic> json){
    return PcScreenModel(
        int.parse(json['pcScreenId'].toString()),
        int.parse(json['screenBrandId'].toString()),
        bool.parse(json['isScreenCurved'].toString()),
        json['screenSize'],
        json['notes'],
        json['serialNumber'],
        json['startDate'],
        json['endDate'],
        int.parse(json['createdBy'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    'pcScreenId': pcScreenId,
    'screenBrandId': screenBrandId,
    'isScreenCurved': isScreenCurved,
    'screenSize': screenSize,
    'notes': notes,
    'serialNumber': serialNumber,
    'startDate': startDate,
    'endDate': endDate,
    'createdBy': createdBy,
  };

}