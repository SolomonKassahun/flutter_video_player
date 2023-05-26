
import '../data_provider.dart/video_data_provider.dart';
import '../models.dart/video_content.dart';

class VideoDataRepository {
  VideoDataProvider videoDataProvider;
  VideoDataRepository({required this.videoDataProvider});

  Future<VideoContent> getVideo(int pagination) async{
    return videoDataProvider.getVideo(pagination);
  }
}