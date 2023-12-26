import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/utils/paleta_cores.dart';
import 'package:facebook_interface/utils/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'image_profile.dart';

class CardPostagem extends StatelessWidget {

  final Postagem postagem;

  const CardPostagem({Key? key, required this.postagem});

  @override
  Widget build(BuildContext context) {

    bool isDesktop = Responsivo.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: isDesktop ? 1 : 0,
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ) : null,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderPostagem(postagem: postagem),
                  SizedBox(height: 10,),
                  Text(postagem.descricao)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(imageUrl: postagem.urlImagem,),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: StaticPostagem(postagem: postagem,),
            )
          ],
        )
      ),
    );
  }
}

class StaticPostagem extends StatelessWidget {
  final Postagem postagem;

  const StaticPostagem({Key? key, required this.postagem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: PaletaCores.azulFaceBook,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.thumb_up, size: 15, color: Colors.white,),
            ),
            SizedBox(width: 4,),
            Expanded(child: Text('${postagem.curtidas}', style: TextStyle(color: Colors.grey[700]),),),
            Text('${postagem.comentarios} comentários', style: TextStyle(color: Colors.grey[700]),),
            SizedBox(width: 8,),
            Text('${postagem.compartilhamentos} - compartilhamentos', style: TextStyle(color: Colors.grey[700]),)
          ],
        ),
        Divider(thickness: 1.2,),
        Row(
          children: [
            ButtonPostagem(
              icone: Icon(LineIcons.thumbsUpAlt, color: Colors.grey[700],),
              texto: "Curtir",
              onTap: (){},
            ),
            ButtonPostagem(
              icone: Icon(LineIcons.alternateCommentAlt, color: Colors.grey[700],),
              texto: "Comentar",
              onTap: (){},
            ),
            ButtonPostagem(
              icone: Icon(LineIcons.share, color: Colors.grey[700],),
              texto: "Compartilhar",
              onTap: (){},
            ),
          ],
        )
      ],
    );
  }
}

class ButtonPostagem extends StatelessWidget {

  final Icon icone;
  final String texto;
  final VoidCallback onTap;

  const ButtonPostagem({Key? key, required this.icone, required this.texto, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: Container(
              child: Row(
                children: [
                  icone,
                  SizedBox(width: 4,),
                  Text('${texto}', style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
        )
    );
  }
}




class HeaderPostagem extends StatelessWidget {
  final Postagem postagem;

  const HeaderPostagem({Key? key, required this.postagem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageProfile(imageUrl: postagem.usuario.urlImagem, foiVisializado: true,),
        SizedBox(width: 8,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(postagem.usuario.nome, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                Row(
                  children: [
                    Text('${postagem.tempoAtras} - '),
                    Icon(Icons.public, size: 12, color: Colors.grey[600],)
                  ],
                )
              ],
            ),
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz),)
      ],
    );
  }
}
