import 'dart:convert';
import 'package:credixco_music_match/model/Track.dart';
import 'package:credixco_music_match/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MusicService {
  Stream getConnectivityStream() {}

  Future<List<Track>> getAllTracks() async {
    var response = await http.get(Constants.TRACK_MASTER);
    var jsonResponse = jsonDecode(response.body);
    List<dynamic> trackList =
        jsonResponse["message"]["body"]["track_list"] as List;
    return trackList.map((jsonTrack) => Track.fromJson(jsonTrack)).toList();
  }

  Future<Track> getTrackDetail(String id) async{
    var response = await http.get(Constants.TRACK_DETAIL + "$id");
    var jsonResponse = jsonDecode(response.body);
    var trackDetail = jsonResponse["message"]["body"]["track"];
    if(trackDetail["has_lyrics"] == 1){
      var lyricResponse = await http.get(Constants.TRACK_LYRICS +"$id");
      var jsonLyricResponse = jsonDecode(lyricResponse.body);
      String lyrics = jsonLyricResponse["message"]["body"]["lyrics"]["lyrics_body"];
      trackDetail["lyrics"] = lyrics;
    }
    return Track.fromJson(trackDetail);
  }

}
