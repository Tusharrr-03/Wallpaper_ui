import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_ui/constants/app_const.dart';
import 'package:wallpaper_ui/data/API%20helper/api_helper.dart';
import 'package:wallpaper_ui/data/repository/wallpaper_repo.dart';
import 'package:wallpaper_ui/screens/detail_page.dart';
import 'package:wallpaper_ui/screens/home/cubit/trending_wal_cubit.dart';
import 'package:wallpaper_ui/screens/search/search_page.dart';

import '../search/cubit/search__cubit.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var querySearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TrendingWalCubit>(context).getTrendingWallPaper();
  }

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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: querySearchController,
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
                      label: Text(
                        "Find Wallpaper..",
                        style: TextStyle(color: Colors.black12),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (querySearchController.text.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                          create: (context) => SearchCubit(
                                              wallPaperRepository:
                                                  WallPaperRepository(
                                                      apiHelper: ApiHelper())),
                                          child: SearchPage(
                                            query: querySearchController.text,
                                          ),
                                        )));
                          }
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.black12,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              /// Heading 1
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Best of the month",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 25,
              ),

              /// Best Of Month Content in Row Formation
              BlocBuilder<TrendingWalCubit, TrendingWalState>(
                  builder: (_, state) {
                if (state is TrendingWalLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is TrendingWalErrorState) {
                  return Center(
                    child: Text(state.errMsg),
                  );
                }

                if (state is TrendingWalLoadedState) {
                  return Container(
                    height: 300,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.listPhotos.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                        ),
                        itemBuilder: (c, index) {
                          var eachPhoto = state.listPhotos[index];
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OpenWallpaper(imgModel: eachPhoto.src!,)));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(21),
                                child: eachPhoto.src!.original != null
                                    ? Image.network(
                                        (eachPhoto.src!.original!).toString(),
                                        width: 200,
                                        height: 300,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(),
                              ),
                            ),
                          );
                        }),
                  );
                }
                return Container();
              }),
              SizedBox(
                height: 20,
              ),

              /// Color Tones
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "The Color Tone",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              /// Color tones and its shades.
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: AppConstants.mColors.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) => SearchCubit(
                                            wallPaperRepository:
                                                WallPaperRepository(
                                                    apiHelper: ApiHelper())),
                                        child: SearchPage(
                                            query: querySearchController.text.isNotEmpty ? querySearchController.text : "Nature",
                                          Color:  AppConstants.mColors[index]['code'],
                                        ),
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 11,
                              right: index == AppConstants.mColors.length - 1
                                  ? 11
                                  : 0),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppConstants.mColors[index]['color'],
                              borderRadius: BorderRadius.circular(11)),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 25,
              ),

              /// Categories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              /// Category
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 11,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: AppConstants.mCategories.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) => SearchCubit(
                                            wallPaperRepository:
                                                WallPaperRepository(
                                                    apiHelper: ApiHelper())),
                                        child: SearchPage(
                                            query: AppConstants
                                                .mCategories[index]['title']),
                                      )));
                        },
                        child: Container(
                          width: 100,
                          height: 200,
                          child: Center(
                              child: Text(
                            AppConstants.mCategories[index]['title'],
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      AppConstants.mCategories[index]['image']),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
