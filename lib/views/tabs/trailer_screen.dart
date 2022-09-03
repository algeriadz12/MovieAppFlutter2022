import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/type/video_type.dart';
import '../../notifiers/movie_controller.dart';

class TrailerScreen extends ConsumerWidget {
  const TrailerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filteredList = ref.watch(MovieController.movieVideosProvider(VideoType(movieId: 539681,videoType: "Trailer")));
    return ListView.builder(
      itemCount: filteredList.value!.length,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset("assets/icons/youtube.png",height: 80,width: 80,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(filteredList.value![index].name!,style: const TextStyle(color: Colors.white,
                        fontFamily: 'mulish_bold'),),
                    const SizedBox(height: 5,),
                    Text("Type : ${filteredList.value![index].type!}",style: const TextStyle(color: Colors.white,
                        fontFamily: 'mulish_regular',fontSize: 13),),
                    const SizedBox(height: 5,),
                    filteredList.value![index].official! ? const Text("Official",style: TextStyle(color: Colors.white,
                        fontFamily: 'mulish_regular',fontSize: 13),)
                        : const Text("Unofficial",style: TextStyle(color: Colors.white,
                        fontFamily: 'mulish_regular',fontSize: 13),),
                    const SizedBox(height: 5,),
                    Text(filteredList.value![index].publishedAt!,style: const TextStyle(color: Colors.white,
                        fontFamily: 'mulish_regular',fontSize: 13),)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

}