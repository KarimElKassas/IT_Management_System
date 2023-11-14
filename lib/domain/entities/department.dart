import 'package:equatable/equatable.dart';

class Department extends Equatable{

  int departmentId;
  String departmentName;

  Department(this.departmentId, this.departmentName);

  @override
  List<Object?> get props => [
    departmentId, departmentName
  ];

}