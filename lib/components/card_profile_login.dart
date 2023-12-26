import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:flutter/material.dart';

class CardProfileLogin extends StatelessWidget {

  final Usuario? usuario;

  CardProfileLogin({Key? key, required Usuario this.usuario});

  @override
  Widget build(BuildContext context) {
    
    _handleShowDialog () {

      showDialog(context: context, builder: (_) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))
            ),
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.all(16),
            //title: Text('Alert Dialog'),
            content: Container(
              width: 390,
              height: 750,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.close), iconSize: 30,),
                    ],
                  ),
                  CircleAvatar(
                    radius: 95,
                    backgroundImage: CachedNetworkImageProvider(usuario!.urlImagem),
                    backgroundColor: Colors.grey[200],
                  ),
                  SizedBox(height: 8,),
                  Text(usuario!.nome, style: TextStyle(fontSize: 20),),
                  SizedBox(height: 15,),
                  new RawKeyboardListener(
                    focusNode: FocusNode(),
                    onKey: (input) => print("*****KEY PRESSED"),
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(onPressed: (){
                        }, icon: Icon(Icons.remove_red_eye_rounded), iconSize: 18 ,),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Checkbox(value: true, tristate: true, onChanged: (value){},),
                      Text("Lembrar a senha")
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(onPressed: (){
                          Navigator.pushNamed(context, '/login');
                        },
                          child: Text("Entrar", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                          style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              backgroundColor: Colors.blue,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)))
                          ),
                        ),
                      ),
                    ],
                  ),
          
                  SizedBox(height: 15,),
          
                  InkWell(
                    child: Text('Esqueceu a senha', style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue
                    )),
                  ),
          
                ],
              ),
            ),
          ),
        );
      });

    }

    return InkWell(
      onTap: () => _handleShowDialog(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          //margin: EdgeInsets.symmetric(vertical: 60),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.grey.shade500),
              bottom: BorderSide(width: 1.0, color: Colors.grey.shade500),
              right: BorderSide(width: 1.0, color: Colors.grey.shade500),
              left: BorderSide(width: 1.0, color: Colors.grey.shade500)
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)
          ),
          height: 210,
          width: 160,
          child: Column(
            children: [
              ClipRRect(
                  child: Image.network(
                    usuario!.urlImagem,
                    fit: BoxFit.cover,
                    height: 160,
                    width: double.infinity,
                  ),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
                /*
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //elevation: 5,
                margin: EdgeInsets.all(0),*/
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(usuario!.nome, style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                    decoration: TextDecoration.none,
                      overflow: TextOverflow.ellipsis
                  ),),
              )
            ],
          ),
        ),
      )
    );
  }
}
