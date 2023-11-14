import 'package:equatable/equatable.dart';

class ScreenBrand extends Equatable{
  int screenBrandId;
  String screenBrandName;

  ScreenBrand(this.screenBrandId, this.screenBrandName);

  @override
  List<Object?> get props => [screenBrandId,screenBrandName];
}