
import '../models.dart/video_content.dart';

class VideoState {}
class VideoStatInitial extends VideoState {}
class VideoStateLoading extends VideoState {}
class VideoStateSuccess extends VideoState {
  VideoContent videoContent;
  VideoStateSuccess({required this.videoContent});
}
class VideoStateFailure extends VideoState {
  String message;
  VideoStateFailure({required this.message});
}