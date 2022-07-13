import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/routes.dart';

class CustomDialogContestTips extends StatefulWidget {
  const CustomDialogContestTips({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDialogContestTipsState createState() =>
      _CustomDialogContestTipsState();
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
      padding: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
      margin: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackGroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'خطوات بدأ المسابقة',
                style: const TextStyle(
                    fontSize: 20.0,
                    color: AppColors.blackLightColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1- ',
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColors.blackLightColor),
                        textAlign: TextAlign.start,
                      ),
                      Expanded(
                        child: Text(
                          'يجب أن تكون انت ضمن أحد المولات أو المحلات التجارية المشاركة بالتطبيق.',
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColors.blackLightColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2- ',
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColors.blackLightColor),
                        textAlign: TextAlign.start,
                      ),
                      Expanded(
                        child: Text(
                          'اضغط على بدء المسابقة.',
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColors.blackLightColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3- ',
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColors.blackLightColor),
                        textAlign: TextAlign.start,
                      ),
                      Expanded(
                        child: Text(
                          'اختر من القائمة المول أو المحل المتواجد به حاليا.',
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColors.blackLightColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '4- ',
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColors.blackLightColor),
                        textAlign: TextAlign.start,
                      ),
                      Expanded(
                        child: Text(
                          'سجل رقم فاتورة الشراء الخاصة بك التابعة لأحد المحلات المشتركة في التطبيق للبدء في المسابقة.',
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColors.blackLightColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '5- ',
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColors.blackLightColor),
                        textAlign: TextAlign.start,
                      ),
                      Expanded(
                        child: Text(
                          'مسح الباركود للمحلات وجمع النقاط للفوز بالجوائز اليومية.',
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColors.blackLightColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '6- ',
                        style: const TextStyle(
                            fontSize: 15.0, color: AppColors.blackLightColor),
                        textAlign: TextAlign.start,
                      ),
                      Expanded(
                        child: Text(
                          'عند جمع رصيد محدد من النقاط(500 نقطة) يؤهلك ذلك للانتقال للمراحل التالية.',
                          style: const TextStyle(
                              fontSize: 15.0, color: AppColors.blackLightColor),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 2,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.grayColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'يمكنكم قراءة المزيد ',
                        style: const TextStyle(
                            fontSize: 14.0, color: AppColors.blackLightColor),
                        textAlign: TextAlign.start,
                      ),
                      InkWell(
                        child: Text(
                          'حول المسابقات.',
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.blue),
                          textAlign: TextAlign.start,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, Routes.aboutScreen);
                        },
                      )
                    ],
                  ),
                  Platform.isAndroid
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'إن المسابقات والجوائز المقدمة ليست من تنظيم أو تقديم أو دعم شركة Apple',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: AppColors.grayColor,
                                  //fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),

            /*
            Text(
              'ادخل على المول المتواجد به أو ضمن المحلات التجارية وسجل رقم فاتورة الشراء الخاصة بك وذلك عن طريق أحد المحلات المشتركة في التطبيق للبدء في المسابقة من ثم مسح الباركود للمحلات وجمع النقاط للفوز بالجوائز اليومية ليؤهلك ذلك بالدخول إلى لمسابقات الأسبوعية والشهرية والثلاث أشهر في حال شرائك أي منتجات أخرى من المحلات المشتركة في تطبيق بريق الإعلان (معنا الكل فائز).',
              style: const TextStyle(
                  fontSize: 16.0, color: AppColors.blackLightColor),
              textAlign: TextAlign.center,
            ),
            */
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
