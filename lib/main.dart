import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/view/screens/home.dart';
import 'package:newsapp/view_model/bloc/news_app_cubit.dart';
import 'package:newsapp/view_model/network/local/shared_preference.dart';
import 'package:newsapp/view_model/network/remote/dio_helper.dart';
import 'package:newsapp/view_model/utiles/themes/dark_mode.dart';
import 'package:newsapp/view_model/utiles/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  //Bloc.observer = MyBlocObserver();
  await SharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsAppCubit()..getBusinessNew(),
        ),
      ],
      child: BlocConsumer<NewsAppCubit, NewsAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: LightMode.lightTheme,
            darkTheme: DarkMode.darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsApp(),
          );
        },
      ),
    );
  }
}
