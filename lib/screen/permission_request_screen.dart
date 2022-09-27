import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/text_style.dart';
import 'package:permission_handler/permission_handler.dart';

import '../custom/custom_card_legacy.dart';

class PermissionRequestScreen extends StatefulWidget {
  const PermissionRequestScreen({Key? key}) : super(key: key);

  static const String routeName = "/request_permission_screen";

  @override
  _PermissionRequestScreenState createState() => _PermissionRequestScreenState();
}

class _PermissionRequestScreenState extends State<PermissionRequestScreen> with WidgetsBindingObserver {

  String? _result;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (Platform.isAndroid) {
        final info = await DeviceInfoPlugin().androidInfo;
        // if (info.version.sdkInt! <= 31) {
        //   var locationStatus = await Permission.locationAlways.status;
        //   if (locationStatus.isDenied) {
        //
        //   }
        print('locationAlwaysStatus: ${await Permission.locationAlways.status.isGranted}, locationWhenInUseStatus: ${await Permission.locationWhenInUse.status.isGranted}');
      }
    }
  }


  Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      if (info.version.sdkInt! >= 31) {
        var scanStatus = await Permission.bluetoothScan.status;
        var connectStatus = await Permission.bluetoothConnect.status;
        if (scanStatus.isDenied || connectStatus.isDenied) {
          // var result = await [Permission.bluetoothScan, Permission.bluetoothConnect].request();
          // return result.entries.where((element) => element.value.isDenied).isNotEmpty;
        }
        return scanStatus.isGranted && connectStatus.isGranted;
      } else if (info.version.sdkInt == 31) {
        // Android 11(sdk 31)은 항상허용이 포함되어있지 않으므로 openAppSettings로 가서 허용 유도
        openAppSettings();
      } else {
        // Android 10 이하
        var locationAlwaysStatus = await Permission.locationAlways.status;
        var locationWhenInUseStatus = await Permission.locationWhenInUse.status;
        print('locationAlwaysStatus: $locationAlwaysStatus, locationWhenInUseStatus: $locationWhenInUseStatus');
        if (locationAlwaysStatus.isDenied) {
          var result = await [Permission.locationAlways, Permission.locationWhenInUse].request();
          if(result.entries.where((element) => (element.key == Permission.locationAlways && (element.value.isDenied || element.value.isPermanentlyDenied))).isNotEmpty) {
            print('항상 허용이 denied일 경우');
          }}
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'CheckPermissionScreen',
          style: kNotoSansMedium16.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(_result ?? "", style: kNotoSansBold14.copyWith(color: Colors.white),),
            TextButton(onPressed: _requestPermission, child: Text("request permission", style: kNotoSansBold14.copyWith(color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}