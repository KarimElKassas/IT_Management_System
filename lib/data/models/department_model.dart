import 'package:it_work/domain/entities/department.dart';

class DepartmentModel extends Department{
  DepartmentModel(super.departmentId, super.departmentName);

  factory DepartmentModel.fromJson(Map<String, dynamic> json){
    return DepartmentModel(
        int.parse(json['departmentId'].toString()),
        json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'departmentId': departmentId,
    'departmentName': departmentName,
  };
}