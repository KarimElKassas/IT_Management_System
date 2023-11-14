import 'package:equatable/equatable.dart';

class Area extends Equatable{

  int areaId;
  String areaName;
  int sectorId;

  Area(this.areaId, this.areaName,this.sectorId);

  @override
  List<Object?> get props => [
    areaId, areaName, sectorId
  ];

}