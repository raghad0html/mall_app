import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';
import 'package:mall_app/main_sdk/apis/user/models/user_model.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/user/user_controller.dart';
import 'package:mall_app/ui/shared/widget/custon_dialog_box.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../widget/header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends StateMVC<ProfilePage> {
  late UserController _con;

  _ProfilePageState() : super(UserController()) {
    _con = controller as UserController;
  }

  @override
  void initState() {
    super.initState();
    _con.getUserData();
    _con.getCity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(S.of(context).userProfile),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    //  barrierDismissible: false,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                        title: S.of(context).attention,
                        subTitle: S.of(context).doyouWantToLogout,
                        textInButton: S.of(context).yes,
                        textInButton2: S.of(context).no,
                        icon: Icons.account_circle,
                        check: false,
                        callback: () {
                          LocalStorageService().logOut();
                          LocalStorageService().login = false;
                          Navigator.pushReplacementNamed(
                              context, Routes.loginScreen);
                        },
                        callback2: () {
                          Navigator.pop(context);
                        },
                      );
                    });
              },
              icon: const Icon(Icons.logout_rounded)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.aboutScreen);
              },
              icon: const Icon(Icons.info_outline)),
        ],
      ),
      body: Builder(builder: (context) {
        if (_con.userModel == null && _con.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  HeaderWidget(
                      text: _con.userModel?.name ?? '', iconData: Icons.person),
                  HeaderWidget(
                      text: _con.userModel?.email ?? '', iconData: Icons.email),
                  HeaderWidget(
                      text: _con.userModel?.phone ?? '', iconData: Icons.phone),
                  HeaderWidget(
                      text: _con.userModel?.cityName ?? '',
                      iconData: Icons.location_city),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes.updateProfileScreen,
                                  arguments: UserArgs(
                                      userModel: _con.userModel!,
                                      onChanges: (UserModel user) {
                                        setState(() {
                                          _con.userModel = user;
                                        });
                                      }));
                        },
                        child: Text(S.of(context).edit),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
