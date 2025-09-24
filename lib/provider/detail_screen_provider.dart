import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fundamental_submission1/api/data/api_service.dart';
import 'package:fundamental_submission1/static/status.dart';

class Detailscreenprovider extends ChangeNotifier {
  final Apiservice api;
  Detailscreenprovider({required this.api});

  StatusResponseListRestoran _status = ListRestoranIdle();

  StatusResponseListRestoran get status => _status;

  Future fetchdataDetail(String id) async {
    _status = ListRestoranLoading();
    try {
      final dataini = await api.getRestoranDetail(id);
      if (dataini.error) {
        _status = ListRestoranError(
          message: "terjadi kesalahan ${dataini.message}",
        );
      } else {
        _status = ListRestoranSuksesDetail(data: dataini);
      }
    } on SocketException{
      _status = ListRestoranError(message: "tidak ada internet");
    } catch (e) {
      _status = ListRestoranError(message: "terjadi kesalahan yang tidak diinginkan");
    } finally {
      notifyListeners();
    }
  }
}
