import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player/src/data_provider.dart/video_data_provider.dart';


import 'bloc_observer.dart';
import 'src/bloc/video_bloc.dart';
import 'src/data_repository.dart/video_data_repository.dart';
import 'src/screen/home_screen.dart';

void main() {
    Bloc.observer = AppBlocObserver();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({super.key});
 final VideoDataRepository videoDataRepository = VideoDataRepository(videoDataProvider: VideoDataProvider());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VideoBloc>(create: (_) => VideoBloc(videoDataRepository: videoDataRepository)),
      ],
      child: const  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        
      ),
    );
  }
}