// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'controller_list_video_bloc.dart';

abstract class ControllerListVideoEvent {}

class GetVideoFromAPI extends ControllerListVideoEvent {}

class OnVideoIndexChange extends ControllerListVideoEvent {}
