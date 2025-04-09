import 'package:dio/dio.dart';
import 'package:music_flutter_app/models/spotify_model.dart';

class SpotifyController {
  final Dio dio = Dio();
  final String url = "https://spotifyapi.caliphdev.com";

  Future<SpotifyModels?> searchQuery({required String query}) async {
    try {
      final String endpoint =
          "$url/api/search/tracks?q=${Uri.encodeComponent(query)}";
      final response = await dio.get(endpoint);
      print(response);
      if (response.statusCode == 200 && response.data != null) {
        return SpotifyModels.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
