import 'package:cloud_firestore/cloud_firestore.dart';

class DiagnosticResult {
  late final String docUid;
  late final String username;
  late final String phone;
  late final String email;
  late final String fullName;
  late final String gender;
  late final String placeOfBirth;
  late final Timestamp? dateOfBirth;
  late final String address;
  late final String status;
  late final Timestamp? lastLogin;
  late final Timestamp? createdAt;
  late final Timestamp? updatedAt;

  DiagnosticResult({
    required this.docUid,
    required this.username,
    required this.phone,
    required this.email,
    required this.fullName,
    required this.gender,
    required this.placeOfBirth,
    required this.dateOfBirth,
    required this.address,
    required this.status,
    required this.lastLogin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DiagnosticResult.fromData(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return DiagnosticResult(
      docUid: doc.id,
      username: doc.data()!['username'],
      phone: doc.data()!['phone'],
      email: doc.data()!['email'],
      fullName: doc.data()!['fullName'],
      gender: doc.data()!['gender'],
      placeOfBirth: doc.data()!['placeOfBirth'],
      dateOfBirth: doc.data()!['dateOfBirth'],
      address: doc.data()!['address'],
      status: doc.data()!['status'],
      lastLogin: doc.data()!['lastLogin'] ?? null,
      createdAt: doc.data()!['createdAt'] ?? null,
      updatedAt: doc.data()!['updatedAt'] ?? null,
    );
  }

  Map<String, dynamic> toData() {
    return {
      'docUid': docUid,
      'username': username,
      'phone': phone,
      'email': email,
      'fullName': fullName,
      'gender': gender,
      'placeOfBirth': placeOfBirth,
      'dateOfBirth': dateOfBirth,
      'address': address,
      'status': status,
      'lastLogin': lastLogin,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  static DiagnosticResult get initialData {
    return DiagnosticResult(
      docUid: '',
      username: '',
      phone: '',
      email: '',
      fullName: '',
      gender: '',
      placeOfBirth: '',
      dateOfBirth: null,
      address: '',
      status: '',
      lastLogin: null,
      createdAt: null,
      updatedAt: null,
    );
  }
}
