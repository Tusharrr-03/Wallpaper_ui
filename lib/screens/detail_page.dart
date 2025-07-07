import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wallpaper_ui/models/wallpaper_model.dart';

class OpenWallpaper extends StatefulWidget {
  SourceModel imgModel;

  OpenWallpaper({required this.imgModel});

  @override
  State<OpenWallpaper> createState() => _OpenWallpaperState();
}

class _OpenWallpaperState extends State<OpenWallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //extendBodyBehindAppBar: true,
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(widget.imgModel.portrait!, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getActionBtn(
                    onTap: () {}, title: "Info", icon: Icons.info_outline),
                getActionBtn(
                    onTap: () {
                      saveWallpaper(context);
                    },
                    title: "Save",
                    icon: Icons.download),
                getActionBtn(
                    onTap: () {
                      //applyWallpaper(context);
                    },
                    title: "Apply",
                    icon: Icons.format_paint,
                    bgColor: Colors.blueAccent),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget getActionBtn(
      {required VoidCallback onTap,
      required String title,
      required IconData icon,
      Color? bgColor}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: bgColor != null ? Colors.blueAccent : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Center(child: Icon(icon)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        )
      ],
    );
  }

  void saveWallpaper(BuildContext context) {
    GallerySaver.saveImage(widget.imgModel.portrait!)
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Center(
              child: Text("Wallpaper Saved..."),
            ))));
  }

  void applyWallpaper(BuildContext context) {
    Wallpaper.imageDownloadProgress(widget.imgModel.portrait!).listen((event) {
      print(event);
    }, onDone: () {
      Wallpaper.homeScreen(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        options: RequestSizeOptions.resizeFit,
      ).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(
            child: Text("Wallpaper set!"),
          ))));
    }, onError: (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Center(
        child: Text(e.toString()),
      )));
    });
  }
}
