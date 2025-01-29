import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> mImages = [
  {
    'image' : "assets/images/wallpaper16.jpg",
  },
  {
    'image' : "assets/images/wallpaper15.jpg",
  },
  {
    'image' : "assets/images/wallpaper14.jpg",
  },
  {
    'image' : "assets/images/wallpaper13.jpg",
  },
  {
    'image' : "assets/images/wallpaper12.jpg",
  },
  {
    'image' : "assets/images/wallpaper11.jpg",
  },
  {
    'image' : "assets/images/wallpaper10.jpg",
  },

];

class NaturePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBF3F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xffEBF3F4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
                  child: Column(
                    children: [
                      Text('Nature' , style: TextStyle(fontSize: 45 , fontWeight: FontWeight.bold),),
                      Text('7 wallpaper available' , style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.grey),),
                    ],
                  ),
                ),
                Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: mImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9/16,
                    ),
                    itemBuilder: (c, i){
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(21),
                            child: Image.asset(mImages[i]['image'] , fit: BoxFit.cover,),
                        ),
                      );
                    },
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}