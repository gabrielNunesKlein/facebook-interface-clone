import 'package:facebook_interface/utils/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavigationAbas extends StatelessWidget {

  final List<IconData> icones;
  final int indiceSlect;
  final Function(int) onTap;
  final bool indicatorBottom = false;

  const NavigationAbas({Key? key, required this.icones, required this.indiceSlect, required this.onTap, indicatorBottom});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTap,
        indicator: BoxDecoration(
          border: indicatorBottom ? Border(
            top: BorderSide(
              color: PaletaCores.azulFaceBook,
              width: 3
            )
          ) :
          Border(
              bottom: BorderSide(
                  color: PaletaCores.azulFaceBook,
                  width: 3
              )
          )
        ),
        tabs: icones.asMap().map((indice, item) {
          return MapEntry(indice,
              Tab(icon: Icon(item,
                color: indiceSlect == indice ? PaletaCores.azulFaceBook : Colors.black54,
              ),)
          );
        }).values.toList()
    );
  }
}
