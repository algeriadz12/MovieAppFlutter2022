import 'package:flutter/material.dart';
import 'package:pop_corn_flix/moor/moor_helper.dart';

class FavMoviesScreen extends StatefulWidget {
  const FavMoviesScreen({Key? key}) : super(key: key);

  @override
  State<FavMoviesScreen> createState() => _FavMoviesScreenState();
}

class _FavMoviesScreenState extends State<FavMoviesScreen> {
  @override
  Widget build(BuildContext context) {
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
                    AppDatabase().deleteAllMovies();
                  }, icon: const Icon(Icons.delete_forever,color: Colors.orange,))
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List<MovieData>>(
                stream: AppDatabase().watchMovies(),
                builder: (context,data){
                  if(data.hasError){
                    return const Center(
                      child: Text("No Movies Added"),
                    );
                  }
                  else if (data.connectionState == ConnectionState.active){
                    return ListView.builder(
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
                                      Text(data.data![index].releaseDate!)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text("No Movies Added"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
