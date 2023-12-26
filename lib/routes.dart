
import 'package:facebook_interface/telas/login.dart';
import 'package:facebook_interface/telas/principal.dart';
import 'package:flutter/material.dart';

class Routes {

  static Route<dynamic> generatedRoutes(RouteSettings settings){

    //final args = settings.arguments;

    switch(settings.name){
      case "/":
        return MaterialPageRoute(
            builder: (_) => LoginPage()
        );

      case "/login":
        return MaterialPageRoute(
            builder: (_) => Principal()
        );
    }

    return _errorRoute();
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text('Error tela não encontrada'),
        ),
        body: Center(
          child: Text('Tela não encontrada'),
        ),
      );
    });
  }


}