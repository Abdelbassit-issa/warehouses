// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:warehouses/constants/emuns.dart';

class UserProfileModel {
  String userID;
  String name;

  String phoneNumber;
  Role role;
  String idNumber;

  UserProfileModel({
    required this.name,

    required this.phoneNumber,
    required this.role,
    required this.idNumber,
    required this.userID,
  });
  // String idNumber;

  factory UserProfileModel.init() {
    return UserProfileModel(
      userID: '',
      name: '',

      phoneNumber: '',
      role: Role.initalUser,
      idNumber: '',
    );
  }
  UserProfileModel copyWith({
    String? userID,
    String? name,

    String? phoneNumber,
    Role? role,
    String? idNumber,
  }) {
    return UserProfileModel(
      userID: userID ?? this.userID,
      name: name ?? this.name,

      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      idNumber: idNumber ?? this.idNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'name': name,

      'phoneNumber': phoneNumber,
      'role': role,
      'idNumber': idNumber,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      userID: map['id'],
      name: map['name'] as String,

      phoneNumber: map['phone_number'] as String,
      role: map['role'] as dynamic,
      idNumber: map['id_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProfileModel(name: $name, phoneNumber: $phoneNumber, role: $role, idNumber: $idNumber)';
  }

  @override
  bool operator ==(covariant UserProfileModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
       
        other.phoneNumber == phoneNumber &&
        other.role == role &&
        other.idNumber == idNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^

        phoneNumber.hashCode ^
        role.hashCode ^
        idNumber.hashCode;
  }

  static Role roleFromString(String role) {
    switch (role) {
      case 'admin':
        return Role.admin;
      case 'user':
        return Role.user;
      case 'chef':
        return Role.chef;
      case 'warehouseEmployee':
        return Role.warehouse_employee;
      default:
        throw Exception('Unknown role: $role');
    }
  }
}
