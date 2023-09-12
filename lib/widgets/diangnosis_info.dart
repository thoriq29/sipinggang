import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/model/diagnosa.dart';
import 'package:sipinggang/provider/diagnosis.dart';
import 'package:sipinggang/provider/diagnosis_info_provider.dart';

class DiagnosisInfo extends StatefulWidget {
  final Diagnosa? diagnosa;
  final Function(GEJALACODES?, double?) callbackFunction;

  DiagnosisInfo({ this.diagnosa, required this.callbackFunction});
  @override
  _DiagnosisInfoState createState() => _DiagnosisInfoState();
}

class _DiagnosisInfoState extends State<DiagnosisInfo> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print('Dispose used');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DiagnosisInfoProvider>(
      builder:  (context, infoProvider, _) {
        if(widget.diagnosa == null || widget.diagnosa?.options == null) {
          return Container();
        }
        return Consumer<DiagnosisProvider>(
          builder: (context, diagnosisProvider, _) {
            return Container(
            width: getHorizontalSize(305.00),
            margin:
                getMargin(left: 35, top: 47, right: 35),
            padding: getPadding(
                left: 32,
                top: 30,
                right: 32,
                bottom: 30),
            decoration: AppDecoration.fillWhiteA700
                .copyWith(
                    borderRadius: BorderRadiusStyle
                        .roundedBorder24),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  
                  Container(
                      width: getHorizontalSize(231.00),
                      child: Text(
                          widget.diagnosa?.title as String,
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle
                              .txtCairoBold20Blue700
                              .copyWith(
                                  height:
                                      getVerticalSize(
                                          1.00)))),
                  Container(
                    child: Column(
                      children: widget.diagnosa!.options!.map((e) {
                      return Padding(
                          padding: getPadding(top: 10),
                          child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Radio(
                                  value: e.value,
                                  groupValue: infoProvider.selectedRadioValue, 
                                  onChanged: (ind) {
                                    infoProvider.setSelectedRadioValue(ind);
                                    Provider.of<DiagnosisProvider>(context, listen: false).updateOrCreateDiagnosa(widget.diagnosa?.code as GEJALACODES, ind);
                                  }
                                ),
                                Container(
                                    margin:
                                        getMargin(left: 12, top: 20),
                                    child: Text(e.title as String,
                                        maxLines: null,
                                        textAlign:
                                            TextAlign.left,
                                        style: AppStyle
                                            .txtCairoBold20Blue700
                                            .copyWith(
                                                height: getVerticalSize(
                                                    1.00))))
                              ]));
                        
                      }).toList(),
                    ),
                  )
                ]
            ));
          }
        );
      },
    );
  }
}
