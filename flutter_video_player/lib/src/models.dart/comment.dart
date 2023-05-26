class Comment {
  int count;
  bool commentingAllowed;
  Comment({required this.count, required this.commentingAllowed});
  Map<String,dynamic> toJson() => {
  'count':count,
  'commentingAllowed':commentingAllowed
  };
  Comment.fromJson(Map<String,dynamic> json) : 
  count = json['count'],
  commentingAllowed = json['commentingAllowed'];
}
