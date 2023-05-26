class Creator {
  String name;
  String id;
  String handle;
  String pic;
  Creator(
      {required this.id,
      required this.name,
      required this.handle,
      required this.pic});
  Map<String, dynamic> toJson() =>
      {'name': name, 'id': id, 'handle': handle, 'pic': pic};
  Creator.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        handle = json['handle'],
        pic = json['pic'];
}
