import 'package:flutter/material.dart';

class Responsivo extends StatelessWidget {

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsivo({Key? key, required this.mobile, this.tablet, required this.desktop});

  static bool isMobile(BuildContext context){
    return MediaQuery.of(context).size.width < 100;
  }

  static bool isTablet(BuildContext context){
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isDesktop(BuildContext context){
    return MediaQuery.of(context).size.width >= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth >= 1200){
            return desktop;
          } else if(constraints.maxWidth >= 800){
            Widget? resTablest = tablet;
            if(resTablest != null){
              return tablet!;
            }
            return mobile;
          }else {
            return mobile;
          }
        }

    );
  }
}
