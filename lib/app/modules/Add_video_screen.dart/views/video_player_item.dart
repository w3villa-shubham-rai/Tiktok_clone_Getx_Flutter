import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({super.key,required this.videoUrl});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
  
}


class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController=VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))..initialize().then((value) {
      videoPlayerController.play();
      //  videoPlayerController.pause();
      videoPlayerController.setVolume(1);
    
    });
  }

  @override
  void dispose() {
    super.dispose();
     videoPlayerController.dispose();
  }

  // void togglePlayPause() {
  //   setState(() {
  //     if (videoPlayerController.value.isPlaying) {
  //       videoPlayerController.pause();
  //     } else {
  //       videoPlayerController.play();
  //     }
  //   });
  // }



  @override
  Widget build(BuildContext context) {
   return FutureBuilder(future: videoPlayerController.initialize(), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
                 return Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
               decoration: const BoxDecoration(
                 color: Colors.black,
               ),
               child: VideoPlayer(videoPlayerController),
      );
      }
      else{
        return const Center(child: CircularProgressIndicator());
      }
    },);
  }
}


