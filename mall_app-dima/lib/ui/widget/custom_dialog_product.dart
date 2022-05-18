import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';

class CustomDialogProduct extends StatefulWidget {
  final String? title, price, description;

  const CustomDialogProduct(
      {Key? key,
      required this.title,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDialogProductState createState() => _CustomDialogProductState();
}

class _CustomDialogProductState extends State<CustomDialogProduct> {
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
            Text(
              widget.title ?? '',
              style: const TextStyle(
                  fontSize: 20.0, color: AppColors.blackLightColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.price!,
                    style: const TextStyle(
                        fontSize: 15.0, color: AppColors.blackLightColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    widget.description!,
                    style: const TextStyle(
                        fontSize: 15.0, color: AppColors.blackLightColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'اغلاق',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
