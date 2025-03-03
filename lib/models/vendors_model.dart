import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class VendorModel {
  final String id;
  final String name;
  final String contact;
  final String address;
  final String email;
  final String vatNumber;
  final String crNumber;
  final DateTime createdAt;

  VendorModel({
    String? id,
    required this.name,
    required this.contact,
    required this.address,
    required this.email,
    required this.vatNumber,
    required this.crNumber,
    DateTime? createdAt,
  }) : id = id ?? uuid.v4(),
       createdAt = createdAt ?? DateTime.now();

  VendorModel copyWith({
    String? id,
    String? name,
    String? contact,
    String? address,
    String? email,
    String? vatNumber,
    String? crNumber,
    DateTime? createdAt,
  }) {
    return VendorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      contact: contact ?? this.contact,
      address: address ?? this.address,
      email: email ?? this.email,
      vatNumber: vatNumber ?? this.vatNumber,
      crNumber: crNumber ?? this.crNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contact': contact,
      'address': address,
      'email': email,
      'vat_number': vatNumber,
      'cr_number': crNumber,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory VendorModel.fromMap(Map<String, dynamic> map) {
    return VendorModel(
      id: map['id'],
      name: map['name'] ?? '',
      contact: map['contact'] ?? '',
      address: map['address'] ?? '',
      email: map['email'] ?? '',
      vatNumber: map['vat_number'] ?? '',
      crNumber: map['cr_number'] ?? '',
      createdAt: DateTime.parse(
        map['created_at'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  String toJson() => toMap().toString();

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel.fromMap(json);
  }

  @override
  String toString() {
    return 'Vendor(id: $id, name: $name, contact: $contact, address: $address, email: $email, vatNumber: $vatNumber, crNumber: $crNumber, createdAt: $createdAt)';
  }
}
