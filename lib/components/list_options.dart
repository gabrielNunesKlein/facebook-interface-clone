import 'package:facebook_interface/components/button_image_profile.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/utils/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListOptions extends StatelessWidget {

  final Usuario usuario;

  final List<List> _options = const [
    [LineIcons.userFriends, PaletaCores.azulFaceBook, "Amigos"],
    [LineIcons.facebookMessenger, PaletaCores.azulFaceBook, "Menssagem"],
    [LineIcons.flag, Colors.orange, "Pagina"],
    [LineIcons.users, PaletaCores.azulFaceBook, "Grupos"],
    [Icons.storefront_outlined, PaletaCores.azulFaceBook, "Marktingplace"],
    [Icons.ondemand_video, Colors.red, "Assistir"],
    [LineIcons.calendar, Colors.deepPurple, "Eventos"],
    [LineIcons.chevronCircleDown, Colors.black45, "Ver mais"]
  ];

  const ListOptions({Key? key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: _options.length + 1,
            padding: EdgeInsets.symmetric(vertical: 6),
            itemBuilder: (context, index) {

              if(index == 0){
                return Padding(padding: EdgeInsets.symmetric(vertical: 6),
                  child: ButtonImageProfile(usuario: usuario, onTap: (){},),
                );
              }

              List item = _options[ index - 1];

              return Padding(padding: EdgeInsets.symmetric(vertical: 6),
                child: Opcoes(icon: item[0], cor: item[1], texto: item[2], onTap: (){},),
              );
            })
    );
  }
}

class Opcoes extends StatelessWidget {

  IconData icon;
  Color cor;
  String texto;
  VoidCallback onTap;

   Opcoes(
      {
        Key? key,
        required this.icon,
        required this.cor,
        required this.texto,
        required this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: cor, size: 35,),
          SizedBox(width: 10,),
          Flexible(
              child: Text(texto, style:
              TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
    );
  }
}

