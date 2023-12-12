import 'package:it_work/domain/entities/seeker.dart';

import '../../domain/entities/sector.dart';

class SeekerModel extends Seeker{
  SeekerModel(super.seekerInformationId, super.seekerName,super.seekerId,super.isMilitary);

  factory SeekerModel.fromJson(Map<String, dynamic> json){
    return SeekerModel(
        json['seekerInformationId'] != null ? int.parse(json['seekerInformationId'].toString()) : 0,
        json['seekerName'],
        int.parse(json['seekerId'].toString()),
        bool.parse(json['isSeekerMilitary'].toString()),

    );
  }

  Map<String, dynamic> toJson() => {
    'seekerInformationId': seekerInformationId,
    'seekerName': seekerName,
    'seekerId': seekerId,
    'isSeekerMilitary': isMilitary,
  };
}