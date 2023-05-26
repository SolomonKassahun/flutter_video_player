


import 'package:flutter_video_player/src/models.dart/comment.dart';
import 'package:flutter_video_player/src/models.dart/creator.dart';
import 'package:flutter_video_player/src/models.dart/reaction.dart';
import 'package:flutter_video_player/src/models.dart/submission.dart';

class Posts {
  List<Post> posts;
  Posts({required this.posts});
  Map<String,dynamic> toJson() => {
   'posts':posts,
  
  };
// Posts.fromJson(Map<String,dynamic> json) : 
// posts= json['posts'].map((post) => post).toList();
 factory Posts.fromJson(Map<String,dynamic> json){
    var lst = json['posts'] as List;
    print("+++++++++++++++++++++++++++++");
    print(lst);
    List<Post> listOfPost = lst.map((e) => Post.fromJson(json['posts'])).toList();
    return Posts(posts: listOfPost);
  }
  
  
  
}

class Post {
  String postId;
  Creator creator;
  Comment comment;
  Reaction reaction;
  Submission submission;
  Post(
      {required this.postId,
      required this.creator,
      required this.comment,
      required this.reaction,
      required this.submission});
  Map<String, dynamic> toJson() => {
        'postId': postId,
        'creator': creator,
        'comment': comment,
        'reaction': reaction,
        'submission': submission
      };
  Post.fromJson(Map<String, dynamic> json)
      : postId = json['postId'],
        creator = Creator.fromJson(json['creator']),
        comment = Comment.fromJson(json['comment']),
        reaction = Reaction.fromJson(json['reaction']),
        submission = Submission.fromJson(json['submission']);
}
