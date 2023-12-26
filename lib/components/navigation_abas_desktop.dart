import 'package:facebook_interface/components/button_image_profile.dart';
import 'package:facebook_interface/components/navigation_abas.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/utils/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'button_circle.dart';

class NavigationAbasDesktop extends StatelessWidget {

  final List<IconData> icones;
  final int indiceSlect;
  final Function(int) onTap;
  final Usuario usuario;

  const NavigationAbasDesktop({Key? key, required this.icones,
    required this.indiceSlect, required this.onTap, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4
          )
        ]
      ),
      child: Row(
        children: [
          Expanded(child: Container(
            child: Text('Facebook', style: TextStyle(
                color: PaletaCores.azulFaceBook,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -1.2
            ),
            ),
          )),
          
          Expanded(child: Container(
            child: NavigationAbas(icones: icones, indiceSlect: indiceSlect, onTap: onTap, indicatorBottom: true,),
          )),

          Expanded(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonImageProfile(usuario: usuario, onTap: (){},),
                  ButtonCircle(icon: LineIcons.search, iconSize: 30, onPressed: (){}),
                  ButtonCircle(icon: LineIcons.facebookMessenger, iconSize: 30, onPressed: (){}),
                ],
              ))
        ],
      ),
    );
  }
}
