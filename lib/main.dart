import 'package:credixco_music_match/bloc/lyrics/lyric_cubit.dart';
import 'package:credixco_music_match/bloc/music/music_cubit.dart';
import 'package:credixco_music_match/screens/home.dart';
import 'package:credixco_music_match/service/music_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MusicCubit(musicService: MusicService())),
        BlocProvider(create: (_) => LyricCubit(musicService: MusicService()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
