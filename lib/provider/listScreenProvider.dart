

import 'package:flutter/material.dart';
import 'package:fundamental_submission1/api/data/api_service.dart';
import 'package:fundamental_submission1/static/status.dart';

class Listscreenprovider extends ChangeNotifier{

  final Apiservice api;

  Listscreenprovider({required this.api});

  StatusResponseListRestoran _status = ListRestoranIdle();

  StatusResponseListRestoran get status => _status;

  Future fetchresto() async {
    _status = ListRestoranLoading();
    notifyListeners();
    final result = await api.getListRestoran();
    try {
      if (result.error) {
        _status = ListRestoranError(message: "terjadi kesalahan : ${result.message}");
        notifyListeners();
      } else {
        _status = ListRestoranSukses(data: result);
        notifyListeners();
      }
    } catch (e) {
      _status = ListRestoranError(message: e.toString());
      notifyListeners();
    }
  }

}