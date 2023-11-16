import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/view/components/text_custom.dart';
import 'package:newsapp/view_model/bloc/news_app_cubit.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: BlocConsumer<NewsAppCubit, NewsAppState>(
        listener: (context, state) {
          if (state is ChangeThemeColorState) {
            Fluttertoast.showToast(
                msg: "ChangeThemeColor",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is ChangeWidgetStyleState) {
            Fluttertoast.showToast(
                msg: "Widget style changed",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustom(
                    data: cubit.isDark ? "LightMode" : "DarkMode",
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.changeTheme();
                    },
                    icon: Icon(
                      cubit.isDark
                          ? Icons.brightness_7_outlined // Dark mode icon
                          : Icons.brightness_4_outlined, // Light mode icon
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustom(
                    data: cubit.isChanged
                        ? "Change Widget Style"
                        : "return to the First Widget style",
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.changeWidgetStyle();
                    },
                    icon: Icon(
                      cubit.isChanged
                          ? Icons.widgets_outlined
                          : Icons.widgets_sharp,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
