import 'package:flutter/material.dart';
import 'package:sipinggang/core/app_export.dart';

import '../model/diagnosa.dart';

class DiagnosisProvider extends ChangeNotifier {
  
  List<Diagnosa>? _diagnosaList = getListDiagnosa();
  Diagnosa? _diagnosaActive = null;
  int _index = 0;
  bool _isLastQuestion = false;

  Map<GEJALACODES?, Map<String?, double?>> _selectedDiagnosa = {};

  DiagnosisProvider() {
    _diagnosaActive = _diagnosaList?[0];
    _selectedDiagnosa[GEJALACODES.P001]={"value": _diagnosaActive?.options![0].value};
  }

  List<Diagnosa>? get diagnosaList => _diagnosaList;
  Map<GEJALACODES?, Map<String?, double?>> get selectedDiagnosaList => _selectedDiagnosa;

  int get index => _index;
  bool get isLastQuestion => _isLastQuestion || (_index >= _diagnosaList!.length -1);
  Diagnosa? get activeDiagnosa => _diagnosaActive;
  
  // void setLastQuestion(int value) {
  //   print(value);
  //   print(_diagnosaList!.length - 1)
  //   if(value > _diagnosaList!.length - 1) {
  //     _isLastQuestion = true;
  //     notifyListeners();
  //   }    
  // }

  void setIndex(int value) {
    if(!_isLastQuestion) {
      print((_diagnosaList!.length - 1));
      _index = value;
      _diagnosaActive = _diagnosaList![value];
      notifyListeners();
    }
  }

  void updateOrCreateDiagnosa(GEJALACODES? code, double? value) {
    Map<String?, double?>? data = {};
    bool exist = _selectedDiagnosa[code] != null;
    if(exist) {
      data = _selectedDiagnosa[code];
      data!["value"] =  value;
    } else {
      _selectedDiagnosa[code] = {"value" : value};
    }
    print(_selectedDiagnosa);
    notifyListeners();
  }

}