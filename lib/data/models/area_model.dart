import 'package:it_work/domain/entities/area.dart';

class AreaModel extends Area{
  AreaModel(super.areaId, super.areaName, super.sectorId);

  factory AreaModel.fromJson(Map<String, dynamic> json){
    print(json);
    print(json['sector'].runtimeType);
    Map<String,dynamic> sectorMap = json['sector'];
    return AreaModel(
        int.parse(json['areaId'].toString()),
        json['name'],
        int.parse(sectorMap['sectorId'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    'areaId': areaId,
    'areaName': areaName,
    'sectorId': sectorId,
  };

}