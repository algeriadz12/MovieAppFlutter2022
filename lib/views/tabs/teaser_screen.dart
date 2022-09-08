import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/type/video_type.dart';
import '../../notifiers/movie_controller.dart';
import '../player_screen.dart';

class TeaserScreen extends ConsumerWidget {
  const TeaserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int movieId = Get.arguments['movieId'];
    var filteredList = ref.watch(MovieController.movieVideosProvider(VideoType(movieId: movieId,videoType: "Teaser")));
    return ListView.builder(
      itemCount: filteredList.value!.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Get.to(() => const PlayerScren(),
                  arguments: [
                    {'videoKey' : filteredList.value![index].key!}
                  ]);
            },
            child: Card(
              color: const Color(0xFF0B2748),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                  Image.asset("assets/icons/youtube.png",height: 80,width: 80,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(filteredList.value![index].name!,style: const TextStyle(color: Colors.white,
                              fontFamily: 'mulish_bold'),),
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const Text("Type : ",style: TextStyle(color: Colors.white,
                                fontFamily: 'mulish_regular',fontSize: 13),),
                            Card(
                              color: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(filteredList.value![index].type!,style: const TextStyle(color: Colors.white,
                                    fontFamily: 'mulish_regular',fontSize: 13),),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        filteredList.value![index].official! ?
                        Card(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Text("Official",style: TextStyle(color: Colors.white,
                                fontFamily: 'mulish_regular',fontSize: 13),),
                          ),
                        ) :
                        Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Text("Unofficial",style: TextStyle(color: Colors.white,
                                fontFamily: 'mulish_regular',fontSize: 13),),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(filteredList.value![index].publishedAt!,style: const TextStyle(color: Colors.white,
                              fontFamily: 'mulish_regular',fontSize: 13),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}