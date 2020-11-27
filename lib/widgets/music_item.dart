import 'package:credixco_music_match/screens/track_detail.dart';
import 'package:flutter/material.dart';

class MusicItem extends StatelessWidget {

  final String trackName, trackAlbumName, trackSingerName;
  final VoidCallback onTap;
  MusicItem({this.trackAlbumName, this.trackName, this.trackSingerName,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:onTap,
      contentPadding: EdgeInsets.all(8.0),
      leading: Icon(Icons.library_music),
      title: Text("$trackName"),
      subtitle: Text("$trackAlbumName"),
      trailing: Text("$trackSingerName"),
    );
  }
}
