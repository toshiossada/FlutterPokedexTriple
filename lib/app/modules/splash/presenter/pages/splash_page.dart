import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/pokeball/pokeball_widget.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Modular.to.navigate('/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF6e95fd),
              Color(0xFF6fdefa),
              Color(0xFFff96d1),
              Color(0xFFF63BB),
            ],
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.24),
                child: PokeballWidget(
                  size: screenHeight * 0.11,
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.14),
                child: Center(
                  child: Text(
                    'Powered by I/O Software',
                    style: GoogleFonts.lato(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
