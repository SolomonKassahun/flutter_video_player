class Submission {
   String mediaUrl;
  String thumbnail;
  String hyperlink;
  String placeholderUrl;
  Submission({required this.mediaUrl, required this.thumbnail,required this.hyperlink,required this.placeholderUrl});
  Map<String,dynamic> toJson() => {
  'mediaUrl':mediaUrl,
  'thumbnail':thumbnail,
  'hyperlink':hyperlink,
  'placeholderUrl':placeholderUrl
  };
  Submission.fromJson(Map<String,dynamic> json) : 
  mediaUrl = json['mediaUrl'],
  thumbnail = json['thumbnail'],
  hyperlink = json['hyperlink'],
  placeholderUrl = json['placeholderUrl'];
}