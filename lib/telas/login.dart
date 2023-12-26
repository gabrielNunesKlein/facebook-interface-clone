import 'package:facebook_interface/components/card_form_login.dart';
import 'package:facebook_interface/components/card_profile_login.dart';
import 'package:facebook_interface/data/data.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/utils/responsivo.dart';
import 'package:flutter/material.dart';
//import 'package:facebook_interface/models/modelos.dart'

import '../utils/paleta_cores.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsivo(mobile: LoginMobile(), desktop: LoginWeb(),)
    );
  }
}

class LoginMobile extends StatelessWidget {

  LoginMobile({Key? key});

  @override
  Widget build(BuildContext context) {

    Usuario usuario1 = Usuario(nome: usuariosOnline[0]!.nome, urlImagem: usuariosOnline[0]!.urlImagem);
    Usuario usuario2 = Usuario(nome: usuariosOnline[1]!.nome, urlImagem: usuariosOnline[1]!.urlImagem);
    Usuario usuario3 = Usuario(nome: usuariosOnline[2]!.nome, urlImagem: usuariosOnline[2]!.urlImagem);

    return SingleChildScrollView(
      child: Container(
        //width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Facebook', textAlign: TextAlign.center, style: TextStyle(
                  color: PaletaCores.azulFaceBook,
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  letterSpacing: -1.2,
                  decoration: TextDecoration.none
              ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text('Logins recentes', textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  decoration: TextDecoration.none
              ),),
            ),
            Text("Clique na sua foto ou adicione uma conta.", textAlign: TextAlign.center, style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                decoration: TextDecoration.none
            ),),

            SizedBox(height: 50,),
            Container(
              //width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 30,
                    children: [
                      CardProfileLogin(usuario: usuario1!),
                      CardProfileLogin(usuario: usuario2!),
                      CardProfileLogin(usuario: usuario3!)
                    ],
                  )
              ),
            ),

            SizedBox(height: 35,),
            CardFormLogin()
          ],
        ),
      ),
    );
  }
}


class LoginWeb extends StatelessWidget {

  LoginWeb({Key? key});

  @override
  Widget build(BuildContext context) {

    Usuario usuario1 = Usuario(nome: usuariosOnline[0]!.nome, urlImagem: usuariosOnline[0]!.urlImagem);
    Usuario usuario2 = Usuario(nome: usuariosOnline[1]!.nome, urlImagem: usuariosOnline[1]!.urlImagem);
    Usuario usuario3 = Usuario(nome: usuariosOnline[2]!.nome, urlImagem: usuariosOnline[2]!.urlImagem);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(92),
        child: Row(
          children: [
            Flexible(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Facebook', textAlign: TextAlign.end, style: TextStyle(
                      color: PaletaCores.azulFaceBook,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      letterSpacing: -1.2,
                      decoration: TextDecoration.none
                  ),),
              
                  Text('Logins recentes', textAlign: TextAlign.end, style: TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                  ),),
                  
                  Text("Clique na sua foto ou adicione uma conta.", textAlign: TextAlign.end, style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.none
                  ),),
                  SizedBox(height: 10,),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 30,
                    children: [
                      CardProfileLogin(usuario: usuario1!),
                      CardProfileLogin(usuario: usuario2!),
                      CardProfileLogin(usuario: usuario3!)
                    ],
                  )
      
                ],
              ),
            ),
      
            Spacer(),
            Flexible(
              flex: 5,
                child: CardFormLogin()
            )
          ],
        ),
      ),
    );
  }
}

