import 'package:facebook_interface/components/button_image_profile.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  
  final List<Usuario> usuarios;
  
  const ContactList({Key? key, required this.usuarios});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [ Row(
          children: [
            Expanded(child: Text('Contatos', style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]
            ),)),

            IconButton(onPressed: (){}, icon: Icon(Icons.video_call)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
          ],
        ),
          Expanded(
            child: ListView.builder(
                  itemCount: usuarios.length,
                  padding: EdgeInsets.symmetric(vertical: 6),
                  itemBuilder: (context, index) {
                  Usuario usuario = usuarios[index];
                  return Padding(padding: EdgeInsets.symmetric(vertical: 6), child: ButtonImageProfile(usuario: usuario, onTap: (){}));
            })
          )
        ]
      ),
    );
  }
}
