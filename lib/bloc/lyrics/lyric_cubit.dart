import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:credixco_music_match/model/Track.dart';
import 'package:credixco_music_match/service/music_service.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

part 'lyric_state.dart';

// This cubit contains logic for the second screen i.e the Track Detail Screen

class LyricCubit extends Cubit<LyricState> {
  final MusicService musicService;

  LyricCubit({this.musicService}) : super(LyricInitialState());

  void getTrackDetails(String id) {
    _getMusicFromRepository(id);
    musicService.getConnectivityStream().listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var isDeviceConnected = await DataConnectionChecker().hasConnection;
        if (isDeviceConnected) {
          // This block executes as soon as the connectivity status changes
          _getMusicFromRepository(id);
        } else {
          emit(LyricErrorState(error: "No Internet Connection"));
        }
      } else {
        emit(LyricErrorState(error: "No Internet Connection"));
      }
    });

  }

  void _getMusicFromRepository(String id) {
    emit(LyricLoadingState());
    musicService.getTrackDetail(id).then((value) {
      emit(LyricSuccessState(trackWithLyrics: value));
    }).catchError((error) {
      emit(LyricErrorState(error: error.toString()));
    });
  }


}
