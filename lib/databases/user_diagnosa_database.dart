import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersDiagnosisDatabase {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String collectionPath = 'diagnosticResults';

  Future addDiagnosticResult(
    Map<String, dynamic> result,
  ) async {
    try {
      await firestore
          .collection(collectionPath)
          .add(result);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}