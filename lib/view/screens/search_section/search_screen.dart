import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/view/components/new_item_component_another_style.dart';
import 'package:newsapp/view/components/text_custom.dart';
import 'package:newsapp/view_model/bloc/news_app_cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextCustom(
          data: "Search",
          color: Colors.white,
        ),
      ),
      body: BlocConsumer<NewsAppCubit, NewsAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    controller: cubit.searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "search must not be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // ma3 kol change haro7 a3ml search
                      cubit.search(value);
                    },
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: state is LoadingSearchState,
                    replacement: (cubit.searchController.text.isNotEmpty)
                        ? ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return NewsComponentAnotherStyle(
                                url: cubit
                                    .articlesListForSearch[index].urlToImage,
                                titleData:
                                    cubit.articlesListForSearch[index].title,
                                date: cubit
                                    .articlesListForSearch[index].publishedAt,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 30),
                            itemCount: cubit.articlesListForSearch.length,
                          )
                        : Container(),
                    // Show an empty container when there's no search query
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
