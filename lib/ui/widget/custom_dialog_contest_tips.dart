import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';

class CustomDialogContestTips extends StatefulWidget {


  const CustomDialogContestTips(
      {Key? key,
    })
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDialogContestTipsState createState() => _CustomDialogContestTipsState();
}

class _CustomDialogContestTipsState extends State<CustomDialogContestTips> {
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
              'ادخل على المول المتواجد به أو ضمن المحلات التجارية وسجل رقم فاتورة الشراء الخاصة بك وذلك عن طريق أحد المحلات المشتركة في التطبيق للبدء في المسابقة من ثم مسح الباركود للمحلات وجمع النقاط للفوز بالجوائز اليومية ليؤهلك ذلك بالدخول إلى لمسابقات الأسبوعية والشهرية والثلاث أشهر في حال شرائك أي منتجات أخرى من المحلات المشتركة في تطبيق بريق الإعلان (معنا الكل فائز).',
              style: const TextStyle(
                  fontSize: 20.0, color: AppColors.blackLightColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
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
