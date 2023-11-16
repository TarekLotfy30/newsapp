import 'package:flutter/material.dart';
import 'package:newsapp/view/components/text_custom.dart';
import 'package:newsapp/view/screens/webview_section/web_view_screen.dart';

class NewsComponent extends StatelessWidget {
  final String? url;
  final String? titleData;
  final String? date;
  final String? initialUrl;

  const NewsComponent({
    super.key,
    this.url,
    this.titleData,
    this.date,
    this.initialUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(initialUrl: initialUrl),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            /*
            loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {...}:
            This is a callback that provides a widget which indicates
            the loading progress of the image. If loadingProgress is null,
            it means the image has finished loading and the function returns the child
            which is the image widget. If loadingProgress is not null, it means the image is still loading,
             and the function returns a CircularProgressIndicator widget that visually represents the loading progress.
            */
            Expanded(
              child: Image.network(
                url ?? "https://demofree.sirv.com/nope-not-here.jpg",
                height: 120,
                width: 100,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.cyanAccent,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextCustom(
                        data: titleData ?? "",
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextCustom(
                      data: date ?? "",
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
