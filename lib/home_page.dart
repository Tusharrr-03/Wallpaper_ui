import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> mWallpaper = [
  {
    'image' : "assets/images/wallpaper1.jpg"
  },
  {
    'image' : "assets/images/wallpaper2.jpg"
  },
  {
    'image' : "assets/images/wallpaper3.jpg"
  },
  {
    'image' : "assets/images/wallpaper4.jpg"
  },
  {
    'image' : "assets/images/wallpaper5.jpg"
  },
  {
    'image' : "assets/images/wallpaper6.jpg"
  },
];
/*
List<Map<String , dynamic>> mColors = [
  {
    'color' : Color(0xffFDB7B9),
  },
  {
    'color' : Color(0xff4164E0),
  },
  {
    'color' : Color(0xff6141E0),
  },
  {
    'color' : Color(0xff60BFC1),
  },
  {
    'color' : Color(0xff292929),
  },
  {
    'color' : Color(0xffFF9A0D),
  },
  {
    'color' : Color(0xffB647EB),
  },
  {
    'color' : Colors.yellow,
  },
  {
    'color' : Colors.orange,
  },
  {
    'color' : Colors.pinkAccent,
  },
];*/


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Color(0xffDBEBF0),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffDBEBF0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Text Field
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffffffff).withOpacity(0.4),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black26,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    label: Text("Find Wallpaper.." ,style: TextStyle(color: Colors.black12),),
                    suffixIcon: Icon(Icons.search , color: Colors.black12,),
                  ),
                ),
              ),SizedBox(height: 20,),

              /// Heading 1
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Best of the month" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
              ),SizedBox(height: 25,),

              /// Best Of Month Content in Row Formation
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height : 300,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                          itemCount: mWallpaper.length,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 400,),
                          itemBuilder: (c , index){
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: ClipRRect(,
                                borderRadius: BorderRadius.circular(21),
                                child: Image.asset(mWallpaper[index]['image'] , width: 200, height: 300, fit: BoxFit.cover,),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              /// Color Tones
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                child: Text("The Color Tone" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
              ),SizedBox(height: 10,),

              /// Color tones and its shades.
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xffFDB7B9),
                          borderRadius: BorderRadius.circular(11)
                        ),
                      ),
                    SizedBox(width: 10,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff4164E0),
                          borderRadius: BorderRadius.circular(11)
                      ),
                    ),SizedBox(width: 10,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff6141E0),
                          borderRadius: BorderRadius.circular(11)
                      ),
                    ),SizedBox(width: 10,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff60BFC1),
                          borderRadius: BorderRadius.circular(11)
                      ),
                    ),SizedBox(width: 10,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff292929),
                          borderRadius: BorderRadius.circular(11)
                      ),
                    ),SizedBox(width: 10,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xffFF9A0D),
                          borderRadius: BorderRadius.circular(11)
                      ),
                    ),SizedBox(width: 10,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xffB647EB),
                          borderRadius: BorderRadius.circular(11)
                      ),
                    ),SizedBox(width: 10,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(11)
                      ),
                    ),SizedBox(width: 10,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(11)
                      ),
                    ),SizedBox(width: 10,),
                  ],
                ),
              ),
              SizedBox(height: 25,),

              /// Categories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Categories" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
              ),SizedBox(height: 10,),

              /// Category 1
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 160,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11),
                            child: Image.asset("assets/images/wallpaper12.jpg", fit: BoxFit.cover,),
                          )
                        ),
                        Positioned(
                          top: 40,
                            left: 40,
                            child: Text("Abstrack" , style: TextStyle(fontSize: 17 , color: Colors.white),),
                        )
                      ],
                    ),SizedBox(width: 10,),
                    Stack(
                      children: [
                        Container(
                            width: 160,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.asset("assets/images/wallpaper10.jpg", fit: BoxFit.cover,),
                            )
                        ),
                        Positioned(
                          top: 40,
                          left: 50,
                          child: Text("Nature" , style: TextStyle(fontSize: 17 , color: Colors.white),),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),

              /// Category 2
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: 160,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.asset("assets/images/wallpaper1.jpg", fit: BoxFit.cover,),
                            )
                        ),
                        Positioned(
                          top: 40,
                          left: 40,
                          child: Text("God Shiva" , style: TextStyle(fontSize: 17 , color: Colors.orange),),
                        )
                      ],
                    ),SizedBox(width: 10,),
                    Stack(
                      children: [
                        Container(
                            width: 160,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.asset("assets/images/wallpaper5.jpg", fit: BoxFit.cover,),
                            )
                        ),
                        Positioned(
                          top: 40,
                          left: 40,
                          child: Text("Ramayana" , style: TextStyle(fontSize: 17 , color: Colors.white),),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

/*

Container(
child: GridView.builder(
scrollDirection: Axis.horizontal,
gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 800),
itemBuilder: (_ , index){
return Container(
width: 50,
height: 50,
decoration: BoxDecoration(
color: Color(mColors[index]['color']),
borderRadius: BorderRadius.circular(11)
),
);
}
),
),*/
