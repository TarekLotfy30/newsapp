import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/view/components/news_item_component.dart';
import 'package:newsapp/view_model/bloc/news_app_cubit.dart';

class ScienceSection extends StatelessWidget {
  const ScienceSection({super.key});

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

          if (state is LoadingScienceNews) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.cyanAccent,
              ),
            );
          }

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => NewsComponent(
              titleData: cubit.articlesListForScience[index].title,
              date: cubit.articlesListForScience[index].publishedAt,
              url: cubit.articlesListForScience[index].urlToImage,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            itemCount: cubit.articlesListForScience.length,
          );
        },
      ),
    );
  }
}
