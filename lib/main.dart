import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cv_app/bloc/file_bloc.dart';
import 'package:my_cv_app/screens/tab_box/tab_box.dart';
import 'package:my_cv_app/services/file_maneger_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FileManagerService();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookBloc()),
      ],
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false),
            home: const TabBox1(),
  )
      );
  }
}