import 'package:flutter/material.dart';

import '../core/app_export.dart';

class AppWidget {
  static AppBar appBar({
    required String title,
    Widget? leading,
    List<Widget>? actions,
  }) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: leading ?? const BackButton(),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      actions: actions,
    );
  }

  // Widget untuk memanggil full dialog isi [loadingText] jika ingin menggunakan title loading
  static loadingPageIndicator({
    required BuildContext context,
    String loadingText = '',
    double loadingSize = 40,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 100),
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.6),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (BuildContext context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: LoadingIndicator(
              loadingText: loadingText,
              loadingSize: loadingSize,
            ),
          ),
        );
      },
    );
  }

  // Custom Widget untuk box info
  static Widget appInfoBox({
    String title = '',
    String subtitle = '',
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstant.blue700.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -6,
            left: -6,
            child: Icon(
              Icons.info,
              size: 35,
              color: ColorConstant.blue700.withOpacity(0.5),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan tidak ada data
  static Widget noData({
    // Size ilustrasi akan menyesuaikan dengan [height] 180.h dan [width] 180.w
    // Ukuran file ilustrasi 500x500
    Widget? illust,
    String title = '',
    String subtitle = '',
    dynamic button = '',
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            illust != null
                ? Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ),
                    height: 180,
                    width: 180,
                    child: Column(
                      children: [
                        illust,
                      ],
                    ),
                  )
                : Container(),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget loading sebelum menampilkan data
  static Widget loadingData({
    String loadingTitle = '',
    double? loadingSize,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(
            height: 16,
          ),
          Text(
            loadingTitle,
          )
        ],
      ),
    );
  }

  // Widget untuk menampilkan dialog
  static Future<dynamic> appDialog(
      {required BuildContext context,
      required String title,
      String? content,
      Widget? image,
      TextAlign? contentTextAlign,
      required List<Widget> buttons,
      bool isDismissible = true}) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: isDismissible,
      transitionDuration: const Duration(milliseconds: 150),
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.6),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (BuildContext context, a1, a2, widget) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: contentTextAlign ?? TextAlign.center,
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    image ?? Container(),
                    Text(content ?? ''),
                  ],
                ),
                backgroundColor: Colors.white.withOpacity(0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                actions: buttons,
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget button yang ada di dalam dialog
  static Widget appDialogButton({
    required String buttonText,
    required Function() onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 14,
          color: ColorConstant.blue700,
        ),
      ),
    );
  }

  // Widget tombol atau button
  static Widget appButton({
    String buttonText = '',
    TextStyle? buttonTextStyle,
    Icon? leftTextIcon,
    Icon? rightTextIcon,
    required Function() onPressed,
    double minWidth = 88.0,
    double height = 36.0,
    Color? color,
    BorderSide? side,
    bool? withSpacing,
  }) {
    return ButtonTheme(
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          minimumSize: Size(minWidth, height),
          backgroundColor: color ?? ColorConstant.blue700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: side ??
                const BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftTextIcon ?? Container(),
            (withSpacing == true) ? SizedBox(width: 5) : Container(),
            Text(
              buttonText,
              style: buttonTextStyle,
            ),
            (withSpacing == true) ? SizedBox(width: 5) : Container(),
            rightTextIcon ?? Container(),
          ],
        ),
      ),
    );
  }

  // Untuk manampilkan snackbar
  static showSnackBar({
    required BuildContext context,
    required Widget content,
    required Duration duration,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: content,
        duration: duration,
      ),
    );
  }
}

//====================[LOADING INDICATOR]====================
class LoadingIndicator extends StatelessWidget {
  final String? loadingText;
  final double loadingSize;
  const LoadingIndicator({
    Key? key,
    this.loadingText,
    required this.loadingSize,
  }) : super(key: key);

  Future<bool> _onWillPop() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: loadingText != ''
          ? Center(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    const SizedBox(height: 10.0),
                    Text(loadingText ?? '')
                  ],
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                dialogContent(context),
              ],
            ),
    );
  }

  dialogContent(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(secondary: ColorConstant.blue700),
          ),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
//====================[END]====================