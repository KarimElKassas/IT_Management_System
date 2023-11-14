
import 'package:it_work/domain/entities/screen_brand.dart';

class ScreenBrandModel extends ScreenBrand{
  ScreenBrandModel(super.screenBrandId, super.screenBrandName);

  factory ScreenBrandModel.fromJson(Map<String, dynamic> json){
    return ScreenBrandModel(
        int.parse(json['pcScreenTypeId'].toString()),
        json['brand'],
    );
  }

  Map<String, dynamic> toJson() => {
    'pcScreenTypeId': screenBrandId,
    'brand': screenBrandName,
  };
}