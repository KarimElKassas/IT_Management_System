import '../../domain/entities/sector.dart';

class SectorModel extends Sector{
  SectorModel(super.sectorId, super.sectorName);

  factory SectorModel.fromJson(Map<String, dynamic> json){
    return SectorModel(
        int.parse(json['sectorId'].toString()),
        json['name']);
  }

  Map<String, dynamic> toJson() => {
    'sectorId': sectorId,
    'sectorName': sectorName,
  };

}