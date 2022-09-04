import 'dart:async';

import 'package:battery_plugin/battery_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/colors.dart';
import 'package:flutter_widgets/text_style.dart';
import 'package:rxdart/rxdart.dart';

class BatteryPluginScreen extends StatefulWidget {
  const BatteryPluginScreen({Key? key}) : super(key: key);

  static const String routeName = "/battery_plugin_screen";

  @override
  State<BatteryPluginScreen> createState() => _BatteryPluginScreenState();
}

class _BatteryPluginScreenState extends State<BatteryPluginScreen> {
  int _batteryPercent = -1;
  String _batteryStatus = 'none';
  String _batteryChargingStateSubscribeText = 'subscribe';

  int _batteryLevelStreamPercent = -1;
  String _batteryLevelStreamSubscribeText = 'subscribe';

  StreamSubscription? _batteryStateSubscription;
  StreamSubscription? _batteryLevelSubscription;

  void _getBatteryLevel() async {
    _batteryPercent = await BatteryPlugin().getBatteryLevel();
    setState(() {});
  }

  void _subscribeBatteryChargingStatus() {
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription?.cancel();
      setState(() {
        _batteryStatus = 'none';
        _batteryChargingStateSubscribeText = 'subscribe';
      });
      return;
    }

    _batteryStateSubscription = BatteryPlugin().getBatteryChargingState().doOnCancel(() {
      _batteryStateSubscription = null;
    }).listen((event) {
      setState(() {
        _batteryStatus = event.name;
        _batteryChargingStateSubscribeText = 'stop';
      });
    }, onError: (error) {
      print("onError:$error");
      setState(() {
        _batteryStatus = 'subscribe onError: $error';
        _batteryChargingStateSubscribeText = 'subscribe';
      });
    }, onDone: () {
      print("subscribe onDone");
      _batteryChargingStateSubscribeText = 'subscribe';
    }, cancelOnError: true);
  }

  void _subscribeBatteryLevel() {
    if (_batteryLevelSubscription != null) {
      _batteryLevelSubscription?.cancel();
      setState(() {
        _batteryLevelStreamPercent = -1;
        _batteryLevelStreamSubscribeText = 'subscribe';
      });
      return;
    }

    _batteryLevelSubscription = BatteryPlugin().getBatteryLevelStream().doOnCancel(() {
      print('batteryLevelStream doOnCancel');
      _batteryLevelSubscription = null;
    }).listen((event) {
      setState(() {
        _batteryLevelStreamPercent = event;
        _batteryLevelStreamSubscribeText = 'stop';
      });
    }, onError: (error) {
      print("onError:$error");
      setState(() {
        _batteryLevelStreamPercent = -1;
        _batteryLevelStreamSubscribeText = 'subscribe';
      });
    }, onDone: () {
      print("subscribe onDone");
      _batteryLevelStreamSubscribeText = 'subscribe';
    }, cancelOnError: true);
  }

  @override
  void dispose() {
    _batteryStateSubscription?.cancel();
    _batteryLevelSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Battery Plugin Screen',
          style: kNotoSansMedium16.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8.0),
            Text(
              'battery percent: $_batteryPercent',
              style: kNotoSansBold14.copyWith(color: AppColors.white),
            ),
            TextButton(
                onPressed: _getBatteryLevel,
                child: Text(
                  'getBatteryLevel',
                  style: kNotoSansBold14.copyWith(color: AppColors.white),
                )),
            Text(
              'battery status: $_batteryStatus',
              style: kNotoSansBold14.copyWith(color: AppColors.white),
            ),
            TextButton(
                onPressed: _subscribeBatteryChargingStatus,
                child: Text(
                  _batteryChargingStateSubscribeText,
                  style: kNotoSansBold14.copyWith(color: AppColors.white),
                )),
            Text(
              'battery stream percent: $_batteryLevelStreamPercent',
              style: kNotoSansBold14.copyWith(color: AppColors.white),
            ),
            TextButton(
                onPressed: _subscribeBatteryLevel,
                child: Text(
                  _batteryLevelStreamSubscribeText,
                  style: kNotoSansBold14.copyWith(color: AppColors.white),
                )),
            Container(
              child: Material(
                child: InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                color: Colors.transparent,
              ),
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
