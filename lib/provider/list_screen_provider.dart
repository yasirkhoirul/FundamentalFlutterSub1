import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fundamental_submission1/api/data/api_service.dart';
import 'package:fundamental_submission1/static/status.dart';

class Listscreenprovider extends ChangeNotifier {
  final Apiservice api;

  Listscreenprovider({required this.api});

  StatusResponseListRestoran _status = ListRestoranIdle();

  StatusResponseListRestoran get status => _status;

  Future fetchresto() async {
    _status = ListRestoranLoading();
    try {
      final result = await api.getListRestoran();
      if (result.error) {
        _status = ListRestoranError(
          message: "terjadi kesalahan : ${result.message}",
        );
      } else {
        _status = ListRestoranSukses(data: result);
      }
    } on SocketException {
      _status = ListRestoranError(message: "Ttidak ada koneksi internet");
    } catch (e) {
      _status = ListRestoranError(message: "mohon maaf terjadi kesalahan");
    } finally {
      notifyListeners();
    }
  }
}
