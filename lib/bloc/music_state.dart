part of 'music_cubit.dart';

@immutable
abstract class MusicState {}

class MusicInitialState extends MusicState {}

class MusicLoadingState extends MusicState{}

class MusicSuccessState extends MusicState{
  final List<Track> trackList;
  final bool single;
  MusicSuccessState({this.trackList, this.single});
}

class MusicErrorState extends MusicState{
  final String error;
  MusicErrorState({this.error});
}
