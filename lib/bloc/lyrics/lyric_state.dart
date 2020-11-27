part of 'lyric_cubit.dart';

@immutable
abstract class LyricState {}

class LyricInitialState extends LyricState {}

class LyricSuccessState extends LyricState{
  final Track trackWithLyrics;
  LyricSuccessState({this.trackWithLyrics});
}

class LyricErrorState extends LyricState{
  final String error;
  LyricErrorState({this.error});
}

class LyricLoadingState extends LyricState{

}
