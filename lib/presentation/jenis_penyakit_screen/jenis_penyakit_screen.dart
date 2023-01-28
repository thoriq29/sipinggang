import 'package:flutter/material.dart';
import 'package:sipinggang/core/app_export.dart';
import 'package:sipinggang/model/diagnosa.dart';
import 'package:sipinggang/widgets/custom_button.dart';

class JenisPenyakitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.blue700,
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: size.width,
                          margin: getMargin(top: 22),
                          padding: getPadding(top: 40, bottom: 40),
                          decoration: AppDecoration.outlineBlack9000f.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL50),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: getVerticalSize(6.00),
                                    width: getHorizontalSize(45.00),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.black90063,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(3.00)))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: getPadding(left: 16, top: 31),
                                        child: Row(children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowleft,
                                              height: getSize(24.00),
                                              width: getSize(24.00),
                                              onTap: () {
                                                onTapImgArrowleft(context);
                                              }),
                                          Padding(
                                              padding:
                                                  getPadding(left: 12, top: 1),
                                              child: Text("Diagnosa",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanMedium18
                                                      .copyWith(
                                                          height:
                                                              getVerticalSize(
                                                                  1.00))))
                                        ]))),
                                Container(
                                    height: getVerticalSize(1.00),
                                    width: size.width,
                                    margin: getMargin(top: 19),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.gray90063)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgSipinggang1,
                                    height: getVerticalSize(100.00),
                                    width: getHorizontalSize(147.00),
                                    margin: getMargin(top: 30)),
                                DiagnosaInfo(0),
                                CustomButton(
                                  height: 58,
                                  width: 305,
                                  text: "Selanjutnya",
                                  onTap: () => Navigator.pushNamed(context, AppRoutes.hasilDiagnosaScreen),
                                  margin: getMargin(top: 22, bottom: 58)
                                  )
                              ]))
                    ]))));
  }

  onTapImgArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}


Widget DiagnosaInfo(int index) {
  List<Diagnosa>? list = getListDiagnosa();
  if(list == null || index+1 > list.length) {
    return Container();
  }
  int? value = list[index].options![0].value;
  
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
                  list[index].title as String,
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
              children: list[index].options!.map((e) {
              return Padding(
                  padding: getPadding(top: 10),
                  child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Radio(
                          value: e.value, 
                          groupValue: value, 
                          onChanged: (int) {
                            
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