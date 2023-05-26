// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../bloc/video_bloc.dart';
import '../bloc/video_event.dart';
import '../bloc/video_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pagination = 0;
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('pagination is ${pagination}');
    FetchSingleVideoEvent fetchSingleVideoEvent =
        FetchSingleVideoEvent(pagination: pagination);
    BlocProvider.of<VideoBloc>(context).add(fetchSingleVideoEvent);

    return Scaffold(
        body: BlocConsumer<VideoBloc, VideoState>(
            builder: ((context, state) {
              if (state is VideoStateLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }
              if (state is VideoStateFailure) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }
              if (state is VideoStateSuccess) {
                // videoUrl =

                return ListView.builder(
                    itemCount: state.videoContent.data.posts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onVerticalDragEnd: (DragEndDetails details) {
                          if (details.primaryVelocity! < 0) {
                            setState(() {
                              pagination += 1;
                            });
                          } else if (details.primaryVelocity! > 0) {
                            if (pagination == 0) {
                              setState(() {
                                pagination -= 1;
                              });
                            }
                          }
                        },
                        // onHorizontalDragEnd: (DragEndDetails details) {
                        //   if (details.primaryVelocity! < 0) {
                        //   } else if (details.primaryVelocity! > 0) {
                        //     index += 1;
                        //   }
                        // },
                        child: Chewie(
                            controller: ChewieController(
                                videoPlayerController:
                                    VideoPlayerController.network(state
                                        .videoContent.data.posts
                                        .map((e) => e.submission.mediaUrl)
                                        .toList()[index]),
                                autoPlay: true,
                                looping: true,
                                aspectRatio: 0.5)),
                      );

                      //  return (chewieController != null) ? Chewie(controller: chewieController!) : const  CircularProgressIndicator();
                    }));

                // return        SingleChildScrollView(
                //       child: Column(
                //         children: state.videoContent.data.posts
                //             .map((e) => Text(e.submission.mediaUrl))
                //             .toList(),
                //       ),
                //     );
              }

              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            }),
            listener: ((context, state) {})));
  }
}
