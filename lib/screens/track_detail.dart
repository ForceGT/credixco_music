import 'package:credixco_music_match/bloc/lyrics/lyric_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackDetail extends StatefulWidget {
  final String id;

  TrackDetail({this.id});

  @override
  _TrackDetailState createState() => _TrackDetailState();
}

class _TrackDetailState extends State<TrackDetail> {
  @override
  Widget build(BuildContext context) {
    // var track = widget.track;
    return Scaffold(
        appBar: AppBar(
          title: Text("Track Details"),
        ),
        body: BlocBuilder<LyricCubit, LyricState>(
          cubit: BlocProvider.of<LyricCubit>(context)
            ..getTrackDetails(widget.id),
          builder: (context, state) {
            if (state is LyricSuccessState) {
              var track = state.trackWithLyrics;
              return SingleChildScrollView(
                  child: Column(children: [
                ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                  title: Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    "${track.trackName}",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                  title: Text(
                    "Artist",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    "${track.artistName}",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                  title: Text(
                    "Album Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    "${track.albumName}",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                  title: Text(
                    "Explicit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    "${track.explicit == 1 ? "True" : "False"}",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                  title: Text(
                    "Rating",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    "${track.trackRating}",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Column(
                  children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                      title: Text("Lyrics",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Text("${track.lyrics}",
                          style: TextStyle(fontSize: 24)),
                    ),
                  ],
                )
              ]));
            } else if (state is LyricLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LyricErrorState) {
              return Center(
                child:Text("${state.error}"),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
