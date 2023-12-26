import 'package:facebook_interface/routes.dart';
import 'package:facebook_interface/telas/home.dart';
import 'package:facebook_interface/telas/login.dart';
import 'package:facebook_interface/telas/principal.dart';
import 'package:facebook_interface/utils/paleta_cores.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    title: 'Facebook',
    debugShowCheckedModeBanner: false,
    onGenerateRoute: Routes.generatedRoutes,
    initialRoute: '/',
    home: LoginPage(), //Principal(),
    theme: ThemeData(
      scaffoldBackgroundColor: PaletaCores.scaffoldColor
    ),
  ));
}
