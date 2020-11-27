import 'package:credixco_music_match/bloc/music_cubit.dart';
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
      body: BlocBuilder<MusicCubit, MusicState>(
        builder: (context, state) {
          debugPrint("State :$state");
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
                  onTap: () async{
                    await navigateToTrackDetail(context,trackList[index].trackId);
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
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void navigateToTrackDetail(BuildContext context, int trackId) async{
    context.read<MusicCubit>().getTrackDetails(trackId.toString());
    Navigator.push(context, MaterialPageRoute(builder: (context) => TrackDetail()));
  }
}
