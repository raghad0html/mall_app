import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/constants/assets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../generated/l10n.dart';

class QrReaderScreen extends StatefulWidget {
  const QrReaderScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrReaderScreenState();
}

class _QrReaderScreenState extends State<QrReaderScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool scanned = false;
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(S.of(context).howToScanBarcode ,style: TextStyle(fontSize: 16),),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 9, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Image.asset(
                                  Assets.assetsFlash,
                                  color: Colors.white,
                                  width: 50,
                                  height: 50,
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Image.asset(
                                    Assets.assetsFlip,
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                  );
                                } else {
                                  return Text(S.of(context).loading);
                                }
                              },
                            )),
                      ),
                      if (Platform.isIOS)
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                              onPressed: () async {
                                await controller?.pauseCamera();
                              },
                              child: Image.asset(
                                Assets.assetsPause,
                                color: Colors.white,
                                width: 50,
                                height: 50,
                              )),
                        ),
                      if (Platform.isIOS)
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                              onPressed: () async {
                                await controller?.resumeCamera();
                              },
                              child: Image.asset(
                                Assets.assetsResume,
                                color: Colors.white,
                                width: 50,
                                height: 50,
                              )),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 300 ||
            MediaQuery.of(context).size.height < 300)
        ? 50.0
        : 200.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColors.appBarBackGroundColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (!scanned) {
        Navigator.of(context).pop(scanData.code);
        scanned = true;
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).noPermission)),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
