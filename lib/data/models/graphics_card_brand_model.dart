import 'package:it_work/domain/entities/graphics_card_brand.dart';

class GraphicsCardBrandModel extends GraphicsCardBrand{
  GraphicsCardBrandModel(super.graphicsCardBrandId, super.graphicsCardBrandName);

  factory GraphicsCardBrandModel.fromJson(Map<String, dynamic> json){
    return GraphicsCardBrandModel(
      int.parse(json['graphicsCardBrandId'].toString()),
      json['brand'],
    );
  }

  Map<String, dynamic> toJson() => {
    'graphicsCardBrandId': graphicsCardBrandId,
    'brand': graphicsCardBrandName,
  };

}