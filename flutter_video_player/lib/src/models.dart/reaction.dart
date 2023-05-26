class Reaction {
   int count;
  bool voted;
  Reaction({required this.count, required this.voted});
  Map<String,dynamic> toJson() => {
  'count':count,
  'voted':voted
  };
  Reaction.fromJson(Map<String,dynamic> json) : 
  count = json['count'],
  voted = json['voted'];
}