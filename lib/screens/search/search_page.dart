import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_ui/models/wallpaper_model.dart';
import 'package:wallpaper_ui/screens/detail_page.dart';

import 'cubit/search__cubit.dart';

class SearchPage extends StatefulWidget {
  String query;
  String Color;

  SearchPage({required this.query, this.Color = ""});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController? scrollController;
  num totalWallCount = 0;
  int totalNumPages = 1;
  int pageCount = 1;
  List<PhotoModel> allWallPapers = [];

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController!.addListener(() {
      if (scrollController!.position.pixels ==
          scrollController!.position.maxScrollExtent) {
        /// end of the list
        print("End of List");

        totalNumPages = totalWallCount ~/ 15 + 1;

        /// Page Count Logic

        if (totalNumPages > pageCount) {
          pageCount++;

          BlocProvider.of<SearchCubit>(context).getSearchWallPaper(
              query: widget.query, color: widget.Color, page: pageCount);
        } else {
          print("You'\ve reached at the end of the page.");
        }
      }
    });

    BlocProvider.of<SearchCubit>(context)
        .getSearchWallPaper(query: widget.query, color: widget.Color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDBEBF0),
        body: BlocListener<SearchCubit, SearchState>(
          listener: (_, state) {
            if (state is SearchLoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Center(child: Text(pageCount != 1 ? "Next Page Loading" : "Loading"))));
            }
            if (state is SearchErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMsg)));
            }
            if (state is SearchLoadedState) {
              totalWallCount = state.totalWallPapers;
              allWallPapers.addAll(state.listPhotos);
              setState(() {});
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: ListView(
              controller: scrollController,
              children: [
                SizedBox(height: 30),
                Text(
                  widget.query,
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "${totalWallCount} wallpapers",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                MasonryGridView.count(
                    shrinkWrap: true,
                    itemCount: allWallPapers.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      var eachPhoto = allWallPapers[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OpenWallpaper(
                                        imgModel: eachPhoto.src!,
                                      )));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: eachPhoto.src?.original != null
                                ? Image.network(
                                    eachPhoto.src!.original!,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  )
                                : Container(color: Colors.grey.shade200),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
