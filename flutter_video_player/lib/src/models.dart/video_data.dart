
import 'package:flutter_video_player/src/models.dart/posts.dart';

class VideoData {
  List<Post> posts;
  int page;
  int offset;
  VideoData({required this.posts,required this.page,required this.offset});
  Map<String,dynamic> toJson() => {
  'posts':posts,
  'page':page,
  'offset':offset
  };
  factory VideoData.fromJson(Map<String,dynamic> json) {
    List<dynamic> dynamicList  = json['posts'];
    List<Post> postList = dynamicList.map((dynamic obj) => Post.fromJson(obj)).toList();
    return VideoData(posts: postList, page: json['page'], offset: json['offset']);
    // posts = json['posts'].toList().map((e) => Post.fromJson(e)).toList(),
    // page = json['page'],
    // offset = json['offset'];
  }
}