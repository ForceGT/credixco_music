import 'package:credixco_music_match/bloc/music/music_cubit.dart';
import 'package:credixco_music_match/model/Track.dart';
import 'package:credixco_music_match/screens/track_detail.dart';
import 'package:credixco_music_match/widgets/music_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Trending"),
      ),
      body: BlocBuilder<MusicCubit, MusicState>(
        cubit: BlocProvider.of<MusicCubit>(context)..getAllTracks(),
        builder: (context, state) {
          if (state is MusicLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MusicSuccessState) {
            var trackList = state.trackList;
            return ListView.separated(
              itemCount: state.trackList.length,
              itemBuilder: (context, index) {
                return MusicItem(
                  onTap: () {
                    navigateToTrackDetail(context,trackList[index]);
                  },

                  trackName: trackList[index].trackName,
                  trackAlbumName: trackList[index].albumName,
                  trackSingerName: trackList[index].artistName,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 2.0,
                );
              },
            );
          } else if (state is MusicErrorState) {
            return Center(
              child: Text("${state.error}"),
            );
          }
          else {
            return Container();
          }
        },
      ),
    );
  }


  void navigateToTrackDetail(BuildContext context, Track track) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => TrackDetail(id: track.trackId.toString(),)));
  }
}
