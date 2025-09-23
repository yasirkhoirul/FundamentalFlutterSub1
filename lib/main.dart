import 'package:flutter/material.dart';
import 'package:fundamental_submission1/api/data/api_service.dart';
import 'package:fundamental_submission1/provider/detailScreenProvider.dart';
import 'package:fundamental_submission1/provider/listScreenProvider.dart';
import 'package:fundamental_submission1/screen/detailscreen.dart';
import 'package:fundamental_submission1/screen/listscreen.dart';
import 'package:fundamental_submission1/static/route.dart';
import 'package:fundamental_submission1/style/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => Apiservice()),
        ChangeNotifierProvider(
          create: (context) =>
              Listscreenprovider(api: context.read<Apiservice>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              Detailscreenprovider(api: context.read<Apiservice>()),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: Themeapps.lightTheme,
      darkTheme: Themeapps.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.listclass.name,
      routes: {
        Routes.listclass.name: (context) => Listscreen(),
        Routes.detail.name: (context) => Detailscreen(
          idRestoran: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}
