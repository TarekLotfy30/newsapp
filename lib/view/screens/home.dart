import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/view/screens/search_section/search_screen.dart';
import 'package:newsapp/view_model/bloc/news_app_cubit.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    NewsAppCubit cubit = NewsAppCubit.get(context);
    return BlocBuilder<NewsAppCubit, NewsAppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titleList[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
                icon: const Icon(
                  Icons.search_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screenList[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems,
            iconSize: 30,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
