import 'package:flutter/material.dart';

class MusicItem extends StatelessWidget {

  final String trackName, trackAlbumName, trackSingerName;
  MusicItem({this.trackAlbumName, this.trackName, this.trackSingerName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8.0),
      leading: Icon(Icons.library_music),
      title: Text("$trackName"),
      subtitle: Text("$trackAlbumName"),
      trailing: Text("$trackSingerName"),
    );
  }
}
