import 'package:facebook_interface/components/navigation_abas.dart';
import 'package:facebook_interface/components/navigation_abas_desktop.dart';
import 'package:facebook_interface/data/data.dart';
import 'package:facebook_interface/utils/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'home.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  final List<Widget> _telas = [
    Home(),
    Scaffold(
      backgroundColor: Colors.green,
    ),
    Scaffold(
      backgroundColor: Colors.yellow,
    ),
    Scaffold(
      backgroundColor: Colors.purple,
    ),
    Scaffold(
      backgroundColor: Colors.grey[600],
    ),
    Scaffold(
      backgroundColor: Colors.orange,
    )
  ];

  List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu
  ];

  int _selected = 0;

  @override
  Widget build(BuildContext context) {

    final bool isDesktop = Responsivo.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        appBar: isDesktop
        ? PreferredSize(child:
            NavigationAbasDesktop(
              usuario: usuarioAtual,
              icones: _icones,
              indiceSlect: _selected,
              onTap: (indice){
                setState(() {
                  _selected = indice;
                });
              },
            ), preferredSize: Size(tamanho.width, 65),)
        : null,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _telas,
        ),
        bottomNavigationBar: isDesktop ? null :
        NavigationAbas(
          indicatorBottom: false,
          icones: _icones,
          indiceSlect: _selected,
          onTap: (indice){
            setState(() {
              _selected = indice;
            });
          },
        ),
      ),
    );
  }
}
