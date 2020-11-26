// primaryGenres and trackNameTranslationList
class Track {
  int trackId;
  String trackName;
  int trackRating;
  int commonTrackId;
  int instrumental;
  int explicit;
  int hasLyrics;
  int hasSubtitles;
  int hasRichSync;
  int numFavourite;
  int albumId;
  String albumName;
  int artistId;
  String artistName;
  String trackShareUrl;
  String trackEditUrl;
  int restricted;
  String updatedTime;
  //PrimaryGenres primaryGenres;

  Track(
      {this.trackId,
        this.trackName,
        this.trackRating,
        this.commonTrackId,
        this.instrumental,
        this.explicit,
        this.hasLyrics,
        this.hasSubtitles,
        this.hasRichSync,
        this.numFavourite,
        this.albumId,
        this.albumName,
        this.artistId,
        this.artistName,
        this.trackShareUrl,
        this.trackEditUrl,
        this.restricted,
        this.updatedTime,
        });

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    trackRating = json['track_rating'];
    commonTrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'];
    hasSubtitles = json['has_subtitles'];
    hasRichSync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
    // primaryGenres = json['primary_genres'] != null
    //     ? new PrimaryGenres.fromJson(json['primary_genres'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track_id'] = this.trackId;
    data['track_name'] = this.trackName;
    // if (this.trackNameTranslationList != null) {
    //   data['track_name_translation_list'] =
    //       this.trackNameTranslationList.map((v) => v.toJson()).toList();
    // }
    data['track_rating'] = this.trackRating;
    data['commontrack_id'] = this.commonTrackId;
    data['instrumental'] = this.instrumental;
    data['explicit'] = this.explicit;
    data['has_lyrics'] = this.hasLyrics;
    data['has_subtitles'] = this.hasSubtitles;
    data['has_richsync'] = this.hasRichSync;
    data['num_favourite'] = this.numFavourite;
    data['album_id'] = this.albumId;
    data['album_name'] = this.albumName;
    data['artist_id'] = this.artistId;
    data['artist_name'] = this.artistName;
    data['track_share_url'] = this.trackShareUrl;
    data['track_edit_url'] = this.trackEditUrl;
    data['restricted'] = this.restricted;
    data['updated_time'] = this.updatedTime;
    // if (this.primaryGenres != null) {
    //   data['primary_genres'] = this.primaryGenres.toJson();
    // }
    return data;
  }
}