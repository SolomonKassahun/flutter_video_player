import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPage extends StatefulWidget {
 final String videoUrl;
  const VideoPlayPage({required this.videoUrl,super.key});

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  void initPlay() async {
    videoPlayerController = VideoPlayerController.network(
      widget.videoUrl,
    );
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }
   @override
  void initState() {
    super.initState();
    initPlay();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return (chewieController != null) ? Chewie(controller: chewieController!) : const  CircularProgressIndicator();
  }
}