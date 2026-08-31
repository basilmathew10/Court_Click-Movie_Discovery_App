import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/presentation/search/widgets/search_header_widget.dart';
import 'package:court_click_movie_dicovery_app/presentation/search/widgets/top_search_item_tile.dart';

class SearchMainScreen extends StatelessWidget {
  const SearchMainScreen({super.key});

  static const List<SearchMovieItem> topSearchesList = [
    SearchMovieItem(
      title: 'Citation',
      imageUrl:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=400&auto=format&fit=crop',
    ),
    SearchMovieItem(
      title: 'Oloture',
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop',
    ),
    SearchMovieItem(
      title: 'The Setup',
      imageUrl:
          'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=400&auto=format&fit=crop',
    ),
    SearchMovieItem(
      title: 'Breaking Bad',
      imageUrl:
          'https://images.unsplash.com/photo-1536440136628-849c177e76a1?q=80&w=400&auto=format&fit=crop',
    ),
    SearchMovieItem(
      title: 'Ozark',
      imageUrl:
          'https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=400&auto=format&fit=crop',
    ),
    SearchMovieItem(
      title: 'The Governor',
      imageUrl:
          'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?q=80&w=400&auto=format&fit=crop',
    ),
    SearchMovieItem(
      title: 'Your Excellency',
      imageUrl:
          'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=400&auto=format&fit=crop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.scaffoldBackground,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: ColorResources.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Search Bar Header
              const SearchHeaderWidget(),

              // Section Title: Top Searches
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 12),
                child: Text(
                  'Top Searches',
                  style: TextStyle(
                    color: ColorResources.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
              ),

              // Top Searches List
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: topSearchesList.length,
                  separatorBuilder: (context, index) => gap4,
                  itemBuilder: (context, index) {
                    final item = topSearchesList[index];
                    return TopSearchItemTile(item: item, onPlayTap: () {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
