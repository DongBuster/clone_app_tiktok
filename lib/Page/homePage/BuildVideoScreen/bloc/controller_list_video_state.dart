part of 'controller_list_video_bloc.dart';

abstract class ControllerListVideoState {
  List<VideoPlayerController> listsController;
  ControllerListVideoState({
    required this.listsController,
  });
}

class InitinalControllerListVideo extends ControllerListVideoState {
  InitinalControllerListVideo({required super.listsController});
}

class ChangeControllerListVideo extends ControllerListVideoState {
  ChangeControllerListVideo({required super.listsController});
}
