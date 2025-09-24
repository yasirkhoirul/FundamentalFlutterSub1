import 'package:fundamental_submission1/api/model/restoran.dart';

sealed class StatusResponseListRestoran {}

class ListRestoranIdle extends StatusResponseListRestoran {}

class ListRestoranLoading extends StatusResponseListRestoran {}

class ListRestoranError extends StatusResponseListRestoran {
  ListRestoranError({required this.message});
  final String message;
}

class ListRestoranSukses extends StatusResponseListRestoran {
  final Restoranlist data;
  ListRestoranSukses({required this.data});
}

class ListRestoranSuksesDetail extends StatusResponseListRestoran {
  final RestorainDetil data;
  ListRestoranSuksesDetail({required this.data});
}
