import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/view/components/new_item_component_another_style.dart';
import 'package:newsapp/view/components/news_item_component.dart';
import 'package:newsapp/view_model/bloc/news_app_cubit.dart';

class BusinessSection extends StatelessWidget {
  const BusinessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: BlocConsumer<NewsAppCubit, NewsAppState>(
        listener: (context, state) async {},
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);

          if (state is LoadingBusinessNews) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.cyanAccent,
              ),
            );
          }

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return cubit.isChanged
                  ? NewsComponent(
                      titleData: cubit.articlesListForBusiness[index].title,
                      date: cubit.articlesListForBusiness[index].publishedAt,
                      url: cubit.articlesListForBusiness[index].urlToImage,
                      initialUrl: cubit.articlesListForBusiness[index].url,
                    )
                  : NewsComponentAnotherStyle(
                      titleData: cubit.articlesListForBusiness[index].title,
                      date: cubit.articlesListForBusiness[index].publishedAt,
                      url: cubit.articlesListForBusiness[index].urlToImage,
                    );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            itemCount: cubit.articlesListForBusiness.length,
          );
        },
      ),
    );
  }
}
