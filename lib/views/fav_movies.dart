import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pop_corn_flix/moor/moor_helper.dart';

import '../movie_state.dart';
import '../notifiers/movie_notifier.dart';


final moviesProvider  = StateNotifierProvider.autoDispose((ref) =>  MovieNotifier());

class FavMoviesScreen extends ConsumerWidget {
  const FavMoviesScreen({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context,WidgetRef ref) {
    // Provider only to access methods
    var provider = ref.watch(moviesProvider.notifier);
    // States ( isLoadig  , isReadyData )
    var providerState = ref.watch(moviesProvider.notifier).state;
    print("Data${providerState.movies.toString()}");
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Favorites",style: TextStyle(fontFamily: 'merriweather',fontSize: 18),),
                  IconButton(onPressed: (){
                    provider.deleteAllMovies();
                    Fluttertoast.showToast(msg: "All Movies have been successfully deleted");
                  }, icon: const Icon(Icons.delete_forever,color: Colors.orange,))
                ],
              ),
            ),
            Expanded(
              child: providerState.isLoading ?
              const Center(child: CircularProgressIndicator(color: Colors.orange,),) :
              providerState.isReadyData ? ListView.builder(
                itemCount: ref.read(moviesProvider.notifier).state.movies!.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Material(
                          elevation: 4,
                          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          clipBehavior: Clip.antiAlias,
                          child: ClipRRect(
                            borderRadius : BorderRadius.circular(8),
                            child: Material(
                              child: Image.network(providerState.movies![index].posterUrl,height: 120,width : 80 ,fit: BoxFit.cover,),),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width : 250,
                                  child: Text(providerState.movies![index].title,style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'mulish_bold'
                                  ),maxLines: 2,),
                                ),
                                const SizedBox(height: 10,),
                                SizedBox(
                                  width: 150,
                                  child: Row(
                                    children: [
                                      Image.asset("assets/icons/rating.png",height: 20,width: 20,),
                                      Expanded(child: Text("${providerState.movies![index].rating}/10 Imdb",style: const TextStyle(fontFamily: 'mulish_regular',
                                          color: Color(0xFF9C9C9C)),))
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(providerState.movies![index].releaseDate,style: const TextStyle(fontFamily: 'mulish_bold'),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ) :
              const Center(child: Text('No Movies Added Yet'),),
            )
          ],
        ),
      ),
    );
  }

}


/*
ListView.builder(
                           itemCount: data.data!.length,
                           itemBuilder: (context,index){
                             return Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                 children: [
                                   Material(
                                     elevation: 4,
                                     shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                     clipBehavior: Clip.antiAlias,
                                     child: ClipRRect(
                                       borderRadius : BorderRadius.circular(8),
                                       child: Material(
                                         child: Image.network(data.data![index].posterUrl,height: 120,width : 80 ,fit: BoxFit.cover,),),
                                     ),
                                   ),
                                   const SizedBox(height: 10,),
                                   Expanded(
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           SizedBox(
                                             width : 250,
                                             child: Text(data.data![index].title,style: const TextStyle(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.bold,
                                                 fontFamily: 'mulish_bold'
                                             ),maxLines: 2,),
                                           ),
                                           const SizedBox(height: 10,),
                                           SizedBox(
                                             width: 150,
                                             child: Row(
                                               children: [
                                                 Image.asset("assets/icons/rating.png",height: 20,width: 20,),
                                                 Expanded(child: Text("${data.data![index].rating}/10 Imdb",style: const TextStyle(fontFamily: 'mulish_regular',
                                                     color: Color(0xFF9C9C9C)),))
                                               ],
                                             ),

                                           ),
                                           const SizedBox(height: 10,),
                                           Text(data.data![index].releaseDate,style: const TextStyle(fontFamily: 'mulish_bold'),)
                                         ],
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                             );
                           },
                         )
 */