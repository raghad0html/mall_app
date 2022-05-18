import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/notification/models/notification_model.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../constants/app_theme.dart';
import '../../../generated/l10n.dart';
import '../home_page/home_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends StateMVC<NotificationScreen> {
  late HomeController _con;

  _NotificationScreenState() : super(HomeController()) {
    _con = controller as HomeController;
  }

  @override
  void initState() {
    super.initState();
    _con.getAllNotification();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CostumeAppBar(title: S.of(context).notifications),
            _con.loadingNotifications
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _con.notifications.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      NotificationModel _notification = _con.notifications[i];
                      return InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title:
                                    Text(_notification.notificationTitle ?? ''),
                                content: Container(
                                  child: Text(
                                      _notification.notificationContent ?? ''),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(S.of(context).ok),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      _con.changeNotificationStatus(
                                          _notification);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey.withOpacity(0.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${_notification.notificationDate}',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  Text(
                                    _notification.notificationSeen == 1
                                        ? S.of(context).readed
                                        : S.of(context).notReaded,
                                    style: _notification.notificationSeen == 1
                                        ? Theme.of(context).textTheme.headline3
                                        : Theme.of(context)
                                            .textTheme
                                            .headline3
                                            ?.copyWith(
                                                fontWeight: FontWeight.w900,
                                                color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                              Text(
                                _notification.notificationTitle ?? '',
                                style: _notification.notificationSeen == 1
                                    ? Theme.of(context).textTheme.headline4
                                    : Theme.of(context)
                                        .textTheme
                                        .headline4
                                        ?.copyWith(fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
            if (_con.notifications.isEmpty && !_con.loadingNotifications)
              Text('No notification'),
          ],
        ),
      ),
    );
  }
}
