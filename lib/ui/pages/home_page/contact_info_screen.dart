import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_theme.dart';
import '../../widget/costume_appbar.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CostumeAppBar(title: 'معلومات الاتصال'),
            Expanded(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            height: 200,
                            child: Lottie.asset(
                                'assets/lottie/96060-tta-contact-us.json')),
                        InkWell(
                          onTap: () {
                            openUrl('tel:+966534289235');
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 30,
                                color: AppColors.grayColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '+966534289235',
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            openUrl('mailto:barikmaking@gmail.com');
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.email,
                                size: 30,
                                color: AppColors.grayColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'barikmaking@gmail.com',
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            openUrl('mailto:contact@bareeqe.sa');
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.email,
                                size: 30,
                                color: AppColors.grayColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'contact@bareeqe.sa',
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 30,
                              color: AppColors.grayColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                'المملكة العربية السعودية - الرياض - حي اليرموك - شارع النجاح',
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 30,
                              color: AppColors.grayColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                  'Kingdom of Saudi Arabia - Riyadh - Yarmouk district - An-Najah Street'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

openUrl(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
//  keytool -genkey -v -keystore c:\Users\USER_NAME\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload

//>keytool -genkey -v -keystore G:\Freelance Souliman\mall_app\android\app\cert\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
