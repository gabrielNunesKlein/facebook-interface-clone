import 'package:flutter/material.dart';

class CardFormLogin extends StatelessWidget {
  const CardFormLogin({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 450,
        height: 450,
        //margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black26)
          //shape: BoxShape.circle
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Email ou telefone',
                    border: OutlineInputBorder()
                  /*labelText: 'Nome',
                            suffixIcon: Icon(
                                Icons.person_outline
                            )*/
                ),
              ),

              SizedBox(height: 20,),

              TextField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  border: OutlineInputBorder(),
                  /*labelText: 'Nome',
                            suffixIcon: Icon(
                                Icons.person_outline
                            )*/
                ),
              ),

              SizedBox(height: 20,),

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

              SizedBox(height: 20,),
              Text('Esqueceu a senha', style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue
              )),
              SizedBox(height: 20,),
              Divider(),
              SizedBox(height: 20,),

              TextButton(onPressed: (){

              },
                child: Text("Criar nova conta", style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w300
                ),
                ),
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.green.shade700,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)))
                ),
              ),
            ],
          ),
        )
    );
  }
}
