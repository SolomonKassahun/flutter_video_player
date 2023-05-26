import 'package:bloc/bloc.dart';


import '../data_repository.dart/video_data_repository.dart';
import '../models.dart/video_content.dart';
import 'video_event.dart';
import 'video_state.dart';

class VideoBloc extends Bloc<FetchVideoEvent,VideoState> {
 final VideoDataRepository videoDataRepository;

  VideoBloc({required this.videoDataRepository}):super(VideoStatInitial()) {
  on<FetchVideoEvent>((event, emit) async{
  if(event is FetchSingleVideoEvent){
   emit (VideoStateLoading());
   try {
     final video = await videoDataRepository.getVideo(event.pagination);
   // ignore: unnecessary_type_check
   if(video is VideoContent){
     emit (VideoStateSuccess(videoContent: video));
   } else{
    emit (VideoStateFailure(message: "No internet."));
   }
   } catch (e) {
     emit (VideoStateFailure(message: "No internet."));
   }
  }
  });
  }
  

}