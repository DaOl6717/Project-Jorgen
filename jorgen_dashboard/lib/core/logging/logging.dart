import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger();

void dPrint(String str) {
  if (kDebugMode) {
    logger.d(str);
  }
}

void dInfo(String str) {
  if (kDebugMode) {
    logger.i(str);
  }
}

void dWarn(String str) {
  if (kDebugMode) {
    logger.w(str);
  }
}

void dError(String str) {
  if (kDebugMode) {
    logger.e(str);
  }
}
