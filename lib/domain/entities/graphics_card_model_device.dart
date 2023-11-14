import 'package:equatable/equatable.dart';

class GraphicsCardModelDevice extends Equatable{
  int graphicsCardModelDeviceId;
  String graphicsCardModelDeviceName;
  int graphicsCardModelBrandId;

  GraphicsCardModelDevice(this.graphicsCardModelDeviceId, this.graphicsCardModelDeviceName,this.graphicsCardModelBrandId);

  @override
  List<Object?> get props => [graphicsCardModelDeviceId,graphicsCardModelDeviceName,graphicsCardModelBrandId];
}