import 'package:facebook_interface/components/CardPostagem.dart';
import 'package:facebook_interface/components/area_criar_postagem.dart';
import 'package:facebook_interface/components/area_history.dart';
import 'package:facebook_interface/components/button_circle.dart';
import 'package:facebook_interface/components/contact_list.dart';
import 'package:facebook_interface/components/list_options.dart';
import 'package:facebook_interface/data/data.dart';
import 'package:facebook_interface/models/modelos.dart';
import 'package:facebook_interface/utils/paleta_cores.dart';
import 'package:facebook_interface/utils/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsivo(
          mobile: HomeMobile(scrollController: _scrollController,),
          desktop: HomeDesktop(scrollController: _scrollController,),
        )
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {

  final TrackingScrollController scrollController;

  const HomeMobile({Key? key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            //expandedHeight: 250,
            floating: true,
            centerTitle: false,
            backgroundColor: Colors.white,
            title: Text('Facebook', style: TextStyle(
                color: PaletaCores.azulFaceBook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2
            ),
            ),
            actions: [
              ButtonCircle(icon: LineIcons.search, iconSize: 30, onPressed: (){}),
              ButtonCircle(icon: LineIcons.facebookMessenger, iconSize: 30, onPressed: (){}),
            ],
          ),
          SliverToBoxAdapter(
            child: AreaCriarPostagem(
              user: usuarioAtual,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: AreaHistory(usuario: usuarioAtual, estorias: estorias,),
            ),

          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index){
                    Postagem postagem = postagens[index];

                    return CardPostagem(postagem: postagem);
                  },
                  childCount: postagens.length
              )
          )
        ],
      ),
    );
  }
}

class HomeDesktop extends StatelessWidget {

  final TrackingScrollController scrollController;

  const HomeDesktop({Key? key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Row(
        children: [
          Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: ListOptions(usuario: usuarioAtual,),
              )),
          Spacer(),
          Flexible(
            flex: 5,
            child:
            CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                    child: AreaHistory(usuario: usuarioAtual, estorias: estorias,),
                  ),

                ),
                SliverToBoxAdapter(
                  child: AreaCriarPostagem(
                    user: usuarioAtual,
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                            (context, index){
                          Postagem postagem = postagens[index];

                          return CardPostagem(postagem: postagem);
                        },
                        childCount: postagens.length
                    )
                )
              ],
            ),
          ),
          Spacer(),
          Flexible(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: ContactList(usuarios: usuariosOnline,),
              )
          ),
        ],
      )
    );
  }
}


