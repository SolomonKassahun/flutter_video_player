import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models.dart/video_content.dart';
class VideoDataProvider {
  Future<VideoContent> getVideo(int pagination) async{
   try {
     final request = await http.get(Uri.parse("https://internship-service.onrender.com/videos?page=$pagination"));
     if(request.statusCode == 200){
      print('status code is ${request.statusCode}');
      
      return VideoContent.fromJson(jsonDecode(request.body));
     }
     print('status code is ${request.statusCode}');
      throw const  HttpException("Failed to load Video");
   } catch (e) {
    print("Error is ");
    print(e.toString());
     throw Exception(e.toString());
   }
  }
}