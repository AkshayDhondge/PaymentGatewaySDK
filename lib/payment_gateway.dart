import 'dart:async';

import 'package:flutter/services.dart';

export 'screen_1.dart';
export 'AppHeader.dart';
export 'package:payment_gateway/login_screen.dart';
export 'constants/constants.dart';
export 'package:payment_gateway/internet_connectivity.dart';
export 'package:payment_gateway/PaymentMode.dart';
export 'package:payment_gateway/widgets/border_text_field.dart';

class PaymentGateway {
  static const MethodChannel _channel = const MethodChannel('payment_gateway');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
