// import 'package:clone_app_tiktok/BuildApp/MyApp.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/bloc/controller_list_video_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'BuildApp/my_app.dart';
import 'firebase/firebase_options.dart';

late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://clmutghkfiagjikzhjlk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNsbXV0Z2hrZmlhZ2ppa3poamxrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ5NjQ5NDgsImV4cCI6MjAzMDU0MDk0OH0.9FLLQ-vsrQuRPjFOVkvuZsBPAPPsCmj-ukVAXpWY2sw',
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
