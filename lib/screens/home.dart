import 'package:credixco_music_match/bloc/music_cubit.dart';
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
      body:
      BlocBuilder<MusicCubit,MusicState>(
        builder: (context,state){
          debugPrint("State :$state");
          if(state is MusicLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is MusicSuccessState){
            var trackList = state.trackList;
            return ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
                  return MusicItem(trackName: trackList[index].trackName, trackAlbumName: trackList[index].albumName, trackSingerName: trackList[index].artistName,);
                }
            );
          }
          else if(state is MusicErrorState){
            return Center(
              child: Text("${state.error}"),
            );
          }
          else{
            return Container();
          }

        },

      ),
    );
  }
}