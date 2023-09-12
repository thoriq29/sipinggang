import 'package:flutter/material.dart';
import 'package:sipinggang/provider/hasil_diagnosis.dart';

class DiagnosisInfoProvider extends ChangeNotifier {
  int _activeID = 1;
  double? _selectedRadioValue = 0.8;
  Map<String, double> _listSelectedValue = {};
  Map<String, dynamic> _result = {};

  Map<String, double> get listSelectedValue => _listSelectedValue;
  int get activeID => _activeID;
  double? get selectedRadioValue => _selectedRadioValue;  
  bool get resultDataIsEmpty => _result.keys.length == 0;
  Map<String, dynamic>? get result => findData(GenerateHasilDiagnosis().rules, findCode(_result));
  String get typeHasil => _result.values.first["type"] > 0 ? "POSITIF" : "Terindikasi ";


  void setID(int id) { 
    _activeID = id; 
    notifyListeners();
  }

  void setSelectedRadioValue(double? value) {
    _selectedRadioValue = value;
    notifyListeners();
  }

  void setResult(Map<String, dynamic> value) {
    _result = value;
    notifyListeners();
  }


  Map<String, dynamic>? findData(List<Map<String, dynamic>> rules, dynamic code) {
    
    for (var i = 0; i < rules.length; i++) {
      if (rules[i]["diagnosaCode"].toString() == code) {
        print("ini kode" + code.toString());
        return rules[i];
      }
    }
    return null;
  }

  String findCode(var data) {
    String maxKey = "";
    double maxWeight = 0;
    print(data.toString());

    data.forEach((key, value) {
      if (value['weight'] > maxWeight) {
        maxWeight = value['weight'];
        maxKey = key;
      }  else {
        maxWeight = value['weight'];
        maxKey = key;
      }
    });
    
    print('Data with largest weight:');
    print('Key: $maxKey');
    print('Weight: $maxWeight');
    return maxKey;
  }
}