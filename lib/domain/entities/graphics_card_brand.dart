import 'package:equatable/equatable.dart';

class GraphicsCardBrand extends Equatable{
  int graphicsCardBrandId;
  String graphicsCardBrandName;

  GraphicsCardBrand(this.graphicsCardBrandId, this.graphicsCardBrandName);

  @override
  List<Object?> get props => [graphicsCardBrandId,graphicsCardBrandName];
}