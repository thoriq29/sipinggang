import 'package:sipinggang/core/app_export.dart';

class Diagnosa {
  String? title;
  List<DiagnosaOptions>? options;

  Diagnosa({this.title, this.options});

  Diagnosa.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['options'] != null) {
      options = <DiagnosaOptions>[];
      json['options'].forEach((v) {
        options!.add(new DiagnosaOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DiagnosaOptions {
  String? title;
  int? value;

  DiagnosaOptions({this.title, this.value});

  DiagnosaOptions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    return data;
  }
}

List<Diagnosa>? getListDiagnosa() {
  List<Diagnosa> diagnosaList =  <Diagnosa>[];

  diagnosaData.forEach((element) {
     diagnosaList.add(new Diagnosa.fromJson(element));
  });
  return diagnosaList;
}
