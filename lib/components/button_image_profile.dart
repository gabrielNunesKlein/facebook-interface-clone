import 'package:facebook_interface/components/image_profile.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'button_circle.dart';

class ButtonImageProfile extends StatelessWidget {

  final Usuario usuario;
  final VoidCallback onTap;

  const ButtonImageProfile({Key? key, required this.usuario, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageProfile(imageUrl: usuario.urlImagem, foiVisializado: true,),
          SizedBox(width: 10,),
          Flexible(
              child: Text(usuario.nome, style:
              TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
    );
  }
}
