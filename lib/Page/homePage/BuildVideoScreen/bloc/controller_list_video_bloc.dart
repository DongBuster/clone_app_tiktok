import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'controller_list_video_event.dart';
part 'controller_list_video_state.dart';

class ControllerListVideoBloc
    extends Bloc<ControllerListVideoEvent, ControllerListVideoState> {
  ControllerListVideoBloc()
      : super(InitinalControllerListVideo(listsController: [])) {
    on<GetVideoFromAPI>((event, emit) => _getvideo(emit));
  }

  _getvideo(Emitter<ControllerListVideoState> emit) async {
    List<dynamic> listLinkVideo = [];
    await Supabase.instance.client
        .from('videos')
        .select('linkvideo')
        .then((value) {
      for (int i = 0; i < value.length; i) {
        listLinkVideo.add(value[i]['linkvideo']);
      }

      print(listLinkVideo);
    });
    // await _initializeController(0, listLinkVideo[0]);
    // await _initializeController(1, listLinkVideo[1]);
    // state.listsController[0].play();

    emit(ChangeControllerListVideo(listsController: state.listsController));
  }

  Future _initializeController(int index, String url) async {
    if (state.listsController.length > index && index >= 0) {
      final VideoPlayerController controller =
          VideoPlayerController.networkUrl(Uri.parse(url));
      state.listsController.add(controller);
      await controller.initialize();
    }
  }
}
