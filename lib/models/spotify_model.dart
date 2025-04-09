class SpotifyModels {
  final List<SpotifyModel> spotify;

  SpotifyModels({required this.spotify});

  factory SpotifyModels.fromJson(List<dynamic> data) => SpotifyModels(
    spotify: data.map((e) => SpotifyModel.fromJson(e)).toList(),
  );
}

class SpotifyModel {
  final String title;
  final String artist;
  final String album;
  final String url;
  final String id;
  final String duration;
  final String thumbnail;
  final String previewMp3;

  SpotifyModel({
    required this.album,
    required this.artist,
    required this.duration,
    required this.id,
    required this.previewMp3,
    required this.thumbnail,
    required this.title,
    required this.url,
  });

  factory SpotifyModel.fromJson(Map<String, dynamic> json) => SpotifyModel(
    album: json["album"],
    artist: json["artist"],
    duration: json["duration"],
    id: json["id"],
    previewMp3: json["preview_mp3"],
    thumbnail: json["thumbnail"],
    title: json["title"],
    url: json["url"],
  );
}
