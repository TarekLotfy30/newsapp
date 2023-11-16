import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/view/components/news_item_component.dart';
import 'package:newsapp/view_model/bloc/news_app_cubit.dart';

class SportsSection extends StatelessWidget {
  const SportsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: BlocConsumer<NewsAppCubit, NewsAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);

          if (state is LoadingSportsNews) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.cyanAccent,
              ),
            );
          }

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => NewsComponent(
              titleData: cubit.articlesListForSports[index].title,
              date: cubit.articlesListForSports[index].publishedAt,
              url: cubit.articlesListForSports[index].urlToImage,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            itemCount: cubit.articlesListForSports.length,
          );
        },
      ),
    );
  }
}
