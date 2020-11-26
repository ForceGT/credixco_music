import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:credixco_music_match/model/Track.dart';
import 'package:credixco_music_match/service/music_service.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

part 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  final MusicService musicService;

  MusicCubit({this.musicService}) : super(MusicInitialState()) {
    checkInternet();
  }

  void checkInternet() {
    musicService.getConnectivityStream().listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var isDeviceConnected = await DataConnectionChecker().hasConnection;
        if (isDeviceConnected) {
          emit(MusicLoadingState());
        } else {
          emit(MusicErrorState(error: "No Internet Connection"));
        }
      } else {
        emit(MusicErrorState(error: "No Internet Connection"));
      }
    });
  }

  void getAllTracks() {
    musicService.getAllTracks().then((listOfTracks) {
      emit(MusicSuccessState(single: false, trackList: listOfTracks));
    }).catchError((error) {
      emit(MusicErrorState(error: error.toString()));
    });
  }


  void getTrackDetails(String id){
    musicService.getTrackDetail(id).then((track){
      List<Track> trackListSingleElement = List(1);
      trackListSingleElement.add(track);
      emit(MusicSuccessState(single: true, trackList: trackListSingleElement));
    }).catchError((error){
      emit(MusicErrorState(error: error.toString()));
    });
  }
}
