import 'package:it_work/domain/entities/graphic_card_size.dart';

import '../../domain/entities/hard_drive_size.dart';

class HardDriveSizeModel extends HardDriveSize{
  HardDriveSizeModel(super.sizeId, super.sizeNumber);

  factory HardDriveSizeModel.fromJson(Map<String, dynamic> json){
    return HardDriveSizeModel(
        int.parse(json['sizeId'].toString()),
        json['sizeNumber']
    );
  }

  Map<String, dynamic> toJson() => {
    'sizeId': sizeId,
    'sizeNumber': sizeNumber,
  };
}