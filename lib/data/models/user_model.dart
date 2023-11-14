import '../../domain/entities/user.dart';

class UserModel extends User{
  UserModel(super.userId, super.userName, super.fullName, super.phoneNumber, super.imagePath, super.isMilitary, super.departmentAreaId, super.specialityId, super.roleId, super.birthDate, super.workStartDate, super.workEndDate);

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        int.parse(json['employeeId'].toString()),
        json['userName'],
        json['fullName'],
        json['phoneNumber'],
        json['ImagePath'],
        json['isItMilitary'],
        int.parse(json['departmentAreaId'].toString()),
        int.parse(json['specialtyId'].toString()),
        int.parse(json['roleId'].toString()),
        json['birthOfDate'],
        json['startDateOfWork'],
        json['endDateOfWork']
    );
  }

  Map<String, dynamic> toJson() => {
    'employeeId': userId,
    'userName': userName,
    'fullName': fullName,
    'phoneNumber': phoneNumber,
    'imagePath': imagePath,
    'isItMilitary': isMilitary,
    'departmentAreaId': departmentAreaId,
    'specialtyId': specialityId,
    'roleId': roleId,
    'birthOfDate': birthDate,
    'startDateOfWork': workStartDate,
    'endDateOfWork': workEndDate,
  };

}