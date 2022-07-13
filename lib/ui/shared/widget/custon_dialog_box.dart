import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mall_app/constants/app_theme.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, subTitle, textInButton, textInButton2;
  final bool check; // to check if one button or tow
  final VoidCallback? callback, callback2;
  final IconData? icon;
  final Widget? lottieIcon;
  final Color? color;

  const CustomDialogBox(
      {Key? key,
      this.title,
      this.subTitle,
      this.textInButton = "",
      this.textInButton2 = "",
      this.check = true,
      this.callback,
      this.callback2,
      this.icon,
      this.lottieIcon,
      this.color})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackGroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            widget.lottieIcon != null
                ? widget.lottieIcon!
                : Center(
                    child: Icon(
                    widget.icon!,
                    color: widget.color == null
                        ? AppColors.blackLightColor
                        : Colors.red,
                    size: 50,
                  )),
            Text(
              widget.title ?? '',
              style: TextStyle(
                  fontSize: 20.0,
                  color: widget.color == null
                      ? AppColors.blackLightColor
                      : Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            if (widget.subTitle != null)
              Text(
                widget.subTitle!,
                style: TextStyle(
                    fontSize: 15.0,
                    color: widget.color == null
                        ? AppColors.blackLightColor
                        : Colors.red),
                textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 22,
            ),
            widget.check
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: widget.callback,
                      child: Text(
                        widget.textInButton ?? '',
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: AppColors.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 250.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: widget.callback,
                            child: Text(
                              widget.textInButton ?? '',
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: AppColors.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TextButton(
                            onPressed: widget.callback2,
                            child: Text(
                              widget.textInButton2 ?? '',
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: AppColors.blackLightColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
