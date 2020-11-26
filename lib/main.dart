import 'package:credixco_music_match/bloc/music_cubit.dart';
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
    return BlocProvider(
      create: (_)=>MusicCubit(musicService: MusicService()),
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
