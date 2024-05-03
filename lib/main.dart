// import 'package:clone_app_tiktok/BuildApp/MyApp.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/bloc/controller_list_video_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'BuildApp/my_app.dart';
import 'Page/homePage/BuildVideoScreen/view_all_video.dart';
import 'firebase/firebase_options.dart';
import 'provider/GlobalState.dart';

late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://pxyrpotnfzpgnuzvssfp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB4eXJwb3RuZnpwZ251enZzc2ZwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk0NDY3MDMsImV4cCI6MjAyNTAyMjcwM30.j93m9Xsl1HBb9UPJ0pVhgXR7BT8N8a63Qg4XOSa78_w',
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ControllerListVideoBloc(),
        )
      ],
      child: const SafeArea(child: MyApp()),
    ),
  );
}
