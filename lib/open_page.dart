import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OpenWallpaper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: Container(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Image.asset("assets/images/wallpaper9.jpg", fit: BoxFit.cover,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Positioned(
                    bottom: 10,
                    left: 95,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child:  Center(child: Image.asset("assets/images/info.png" , height: 22 , width: 22, color: Colors.white,)),
                    ),
                  ),SizedBox(width: 10,),
                  Positioned(
                    bottom: 10,
                    left: 170,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child:  Center(child: FaIcon(FontAwesomeIcons.download , color: Colors.white,)),
                    ),
                  ),SizedBox(width: 10,),
                  Positioned(
                    bottom: 10,
                    left: 245,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xff3F64F5),
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child:  Center(child: Image.asset("assets/images/paint-brush (1).png" , height: 25 , width: 25, color: Colors.white,)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}