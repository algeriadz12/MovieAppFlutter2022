import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScren extends StatefulWidget {
  const PlayerScren({Key? key}) : super(key: key);

  @override
  State<PlayerScren> createState() => _PlayerScrenState();
}

class _PlayerScrenState extends State<PlayerScren> {
  late YoutubePlayer _youtubePlayer;
  late YoutubePlayerController _youtubePlayerController;
  String videoKey = '0';

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    videoKey = Get.arguments[0]["videoKey"];
    _youtubePlayerController  = YoutubePlayerController(
      initialVideoId: videoKey.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false
      )
    );
    _youtubePlayer  = YoutubePlayer(controller: _youtubePlayerController);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerBuilder(
        player: _youtubePlayer,
        builder: (context,player){
          return YoutubePlayer(controller: _youtubePlayerController);
        },
      ),
    );
  }
}
