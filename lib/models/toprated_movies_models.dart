// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TopratedMovies {
  int id;
  String title;
  String overview;
  String release_date;
  String media_type;
  String poster_path;
  String backdrop_path;
  int vote_count;
  double vote_average;
  double popularity;
  TopratedMovies({
    required this.id,
    required this.title,
    required this.overview,
    required this.release_date,
    required this.media_type,
    required this.poster_path,
    required this.backdrop_path,
    required this.vote_count,
    required this.vote_average,
    required this.popularity,
  });

  TopratedMovies copyWith({
    int? id,
    String? title,
    String? overview,
    String? release_date,
    String? media_type,
    String? poster_path,
    String? backdrop_path,
    int? vote_count,
    double? vote_average,
    double? popularity,
  }) {
    return TopratedMovies(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      release_date: release_date ?? this.release_date,
      media_type: media_type ?? this.media_type,
      poster_path: poster_path ?? this.poster_path,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      vote_count: vote_count ?? this.vote_count,
      vote_average: vote_average ?? this.vote_average,
      popularity: popularity ?? this.popularity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'overview': overview,
      'release_date': release_date,
      'media_type': media_type,
      'poster_path': poster_path,
      'backdrop_path': backdrop_path,
      'vote_count': vote_count,
      'vote_average': vote_average,
      'popularity': popularity,
    };
  }

  factory TopratedMovies.fromMap(Map<String, dynamic> map) {
    return TopratedMovies(
      id: map['id'] as int? ?? 0,
      title: map['title'] as String? ?? '',
      overview: map['overview'] as String? ?? '',
      release_date: map['release_date'] as String? ?? '',
      media_type: map['media_type'] as String? ?? '',
      poster_path: map['poster_path'] as String? ?? '',
      backdrop_path: map['backdrop_path'] as String? ?? '',
      vote_count: map['vote_count'] as int? ?? 0,
      vote_average: map['vote_average'] as double? ?? 0.0,
      popularity: map['popularity'] as double? ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TopratedMovies.fromJson(String source) =>
      TopratedMovies.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TopratedMovies(id:$id title: $title, overview: $overview, release_date: $release_date, media_type: $media_type, poster_path: $poster_path, backdrop_path: $backdrop_path, vote_count: $vote_count, vote_average: $vote_average, popularity: $popularity)';
  }

  @override
  bool operator ==(covariant TopratedMovies other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.overview == overview &&
        other.release_date == release_date &&
        other.media_type == media_type &&
        other.poster_path == poster_path &&
        other.backdrop_path == backdrop_path &&
        other.vote_count == vote_count &&
        other.vote_average == vote_average &&
        other.popularity == popularity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        release_date.hashCode ^
        media_type.hashCode ^
        poster_path.hashCode ^
        backdrop_path.hashCode ^
        vote_count.hashCode ^
        vote_average.hashCode ^
        popularity.hashCode;
  }
}
