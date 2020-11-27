import 'dart:convert';
import 'package:credixco_music_match/model/Track.dart';
import 'package:credixco_music_match/util/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MusicService {
  Stream<ConnectivityResult> getConnectivityStream() {
    Connectivity connectivity = new Connectivity();
    return connectivity.onConnectivityChanged;
  }

  Future<List<Track>> getAllTracks() async {
    var response = await http.get(Constants.TRACK_MASTER);
    var jsonResponse = jsonDecode(response.body);
    List<dynamic> trackList =
        jsonResponse["message"]["body"]["track_list"] as List;
    // List finalListOfTracksWithLyrics = [];
    // trackList.forEach((trackJson) async {
    //   var track = Track.fromJson(trackJson["track"]);
    //   var trackWithLyrics = await getTrackDetail(track.trackId.toString());
    //   await finalListOfTracksWithLyrics.add(trackWithLyrics);
    // });
    // debugPrint("trackWithLyrics: ${finalListOfTracksWithLyrics.toString()}");
    return trackList.map((trackJson){
      var track = Track.fromJson(trackJson["track"]);
      // var trackWithLyrics = await getTrackDetail(track.trackId.toString());
      return track;
    }).toList();
  }

  Future<Track> getTrackDetail(String id) async{
    var response = await http.get(Constants.TRACK_DETAIL + "$id");
    var jsonResponse = jsonDecode(response.body);
    var trackDetail = jsonResponse["message"]["body"]["track"];
    if(trackDetail["has_lyrics"] == 1){
      trackDetail["lyrics"] = await getTrackLyrics(id);
    }
    return Track.fromJson(trackDetail);
  }

  Future<String> getTrackLyrics(String id) async{
    var lyricResponse = await http.get(Constants.TRACK_LYRICS +"$id");
    var jsonLyricResponse = jsonDecode(lyricResponse.body);
    return jsonLyricResponse["message"]["body"]["lyrics"]["lyrics_body"];
  }

}
