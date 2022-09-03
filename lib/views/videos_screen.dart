import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pop_corn_flix/views/tabs/featurette_screen.dart';
import 'package:pop_corn_flix/views/tabs/teaser_screen.dart';
import 'package:pop_corn_flix/views/tabs/trailer_screen.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> with TickerProviderStateMixin{
  int movieId = 0;
  String movieTitle = '';
  late TabController _tabController;
  final _screens = [
    const FeaturetteScreen(),
    const TeaserScreen(),
    const TrailerScreen()
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    movieTitle = Get.arguments[0]['title'];
    //movieId = Get.arguments[1]['movieId'];

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF16213E),
      body:  SafeArea(
         child: Column(
           children: [
             Center(child: Padding(
               padding: const EdgeInsets.only(top: 20,left: 50,right: 50),
               child: Text(movieTitle,style: const TextStyle(fontFamily: 'merriweather',color: Colors.white,fontSize: 20),
               textAlign: TextAlign.center,),
             )),
             Padding(
               padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
               child: TabBar(
                 indicatorColor: Colors.transparent,
                 controller: _tabController,
                   tabs: const [
                 Tab(child: Text("Featurette",style: TextStyle(fontFamily: 'mulish_bold',color: Colors.white),)),
                 Tab(child: Text("Teaser",style: TextStyle(fontFamily: 'mulish_bold',color: Colors.white),)),
                 Tab(child: Text("Trailer",style: TextStyle(fontFamily: 'mulish_bold',color: Colors.white),))
               ]),
             ),
             Expanded(
               child: TabBarView(
                 controller: _tabController,
                 children: List.generate(_screens.length, (index) => _screens[index]),
               ),
             )
           ],
         ),
      ),
    );
  }
}
