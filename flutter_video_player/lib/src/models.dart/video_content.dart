
 import 'package:flutter_video_player/src/models.dart/video_data.dart';

class VideoContent {
  String message;
  VideoData data;
  
  VideoContent({required this.message,required this.data});

  Map<String,dynamic> toJson() => {
    'message':message,
    'data':data
  };
  VideoContent.fromJson(Map<String,dynamic> json): 
    message = json['message'],
    data = VideoData.fromJson(json['data']);
}
