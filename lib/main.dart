import 'package:flutter/material.dart';
import 'package:wallpaper_ui/home_page.dart';
import 'package:wallpaper_ui/nature_page.dart';
import 'package:wallpaper_ui/open_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "poppins"
      ),
      home: HomePage(),
    );
  }
}


/// sir wallpaper ke home page ka saara content dynamic hota hai yaa nhi???
/// sir color ko generate krne ke liye grid view ka bhi use kr skte hai or list view ka bhi but mere dono me hi ek hi color show ho rha hai
/// and sir categories waala section hai woh dynamic hoga toh usko list me kaise likhege kyuki jo postioned widget ka use hoga uski position ko toh apn set krege.
/// and sir apn jo saari UI bna rhe woh saari apn expanded form me bnayege kya? and if it is possible then the dynamic data ka koi issue nhi hoga kya???
/// and sir jo maine grid view se jo bhi ui bnai hai jaise nature waala page banya hai isme yeh laptop se toh scroll ho jaata hai but on screen krte hai toh nhi hota hai scroll.
/// apm saari ui me expanded widget ka use krege kya sir??? or krege toh dynamic me effect nhi hoga kya?