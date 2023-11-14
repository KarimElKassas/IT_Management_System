import 'package:it_work/domain/entities/graphics_card_model_device.dart';

class GraphicsCardModelDeviceModel extends GraphicsCardModelDevice{
  GraphicsCardModelDeviceModel(super.graphicsCardModelDeviceId, super.graphicsCardModelDeviceName,super.graphicsCardModelBrandId);

  factory GraphicsCardModelDeviceModel.fromJson(Map<String, dynamic> json){
    return GraphicsCardModelDeviceModel(
      int.parse(json['graphicsCardModelId'].toString()),
      json['model'],
      0,
    );
  }


  Map<String, dynamic> toJson() => {
    'graphicsCardModelId': graphicsCardModelDeviceId,
    'model': graphicsCardModelDeviceName,
    'brandId': graphicsCardModelBrandId,
  };

}