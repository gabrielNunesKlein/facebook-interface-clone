import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/components/image_profile.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/utils/paleta_cores.dart';
import 'package:facebook_interface/utils/responsivo.dart';
import 'package:flutter/material.dart';

class AreaHistory extends StatelessWidget {

  final Usuario usuario;
  final List<Estoria> estorias;

  const AreaHistory({Key? key, required this.usuario, required this.estorias});

  @override
  Widget build(BuildContext context) {

    bool isDesktop = Responsivo.isDesktop(context);

    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + estorias.length,
          itemBuilder: (context, index){

            if(index == 0){
              Estoria estoriaUsuario = Estoria(usuario: usuario, urlImagem: usuario.urlImagem);

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: CardHistory(estoria: estoriaUsuario, addHistory: true),
              );
            }

            Estoria estoria = estorias[index - 1];

            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: CardHistory(estoria: estoria,),
            );

      }),
    );
  }
}

class CardHistory extends StatelessWidget {

  final Estoria estoria;
  final bool addHistory;

  const CardHistory({Key? key, required this.estoria, this.addHistory = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(imageUrl: estoria.urlImagem, height: double.infinity,
            width: 110, fit: BoxFit.cover,),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: PaletaCores.degradeHistory,
            borderRadius: BorderRadius.circular(12)
          ),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: addHistory ?
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){},
                    icon: Icon(Icons.add),
                    iconSize: 30,
                    color: PaletaCores.azulFaceBook,
                  )
                  : ImageProfile(imageUrl: estoria.usuario.urlImagem, foiVisializado: estoria.foiVisualizado,)
        )),
        Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
                addHistory ? "Criar Story" :
                estoria.usuario.nome, maxLines: 2, overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
            ),)
        )
      ],
    );
  }
}

