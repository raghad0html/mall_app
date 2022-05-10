import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';

class ErrorsWidget extends StatefulWidget {
  final VoidCallback? callback;
  final String textError;

  const ErrorsWidget({Key? key, this.callback, this.textError = ""})
      : super(key: key);

  @override
  _ErrorsWidgetState createState() => _ErrorsWidgetState();
}

class _ErrorsWidgetState extends State<ErrorsWidget> {
  bool checkIfConnect = true;

  @override
  void initState() {
    super.initState();
    // try{
    //       () async {
    //     await checkInternet().then((value) => {checkIfConnect = value});
    //     setState(() {
    //       // Update your UI with the desired changes.
    //     });
    //   }();
    // }catch(e){}

    checkInternet().then((value) => {
          setState(() {
            checkIfConnect = value;
          })
        });
  }

  Future<bool> checkInternet() async {
    bool checkIfConnect = true;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        checkIfConnect = true;
      }
    } on SocketException catch (_) {
      checkIfConnect = false;
    }
    return checkIfConnect;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  checkIfConnect ? widget.textError : "No internet connection",
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    overflow: TextOverflow.clip,
                  ),
                  textAlign: TextAlign.center,
                )),
            if (widget.callback != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: widget.callback,
                  child: const Text('اعادة المحاولة',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
