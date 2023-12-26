import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/utils/paleta_cores.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {

  final String imageUrl;
  final bool foiVisializado;

  const ImageProfile({Key? key, required this.imageUrl, this.foiVisializado = false});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: PaletaCores.azulFaceBook,
      child: CircleAvatar(
        radius: foiVisializado ? 22 : 18,
        backgroundImage: CachedNetworkImageProvider(imageUrl),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
