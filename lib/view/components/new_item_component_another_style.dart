import 'package:flutter/material.dart';
import 'package:newsapp/view/components/text_custom.dart';

class NewsComponentAnotherStyle extends StatelessWidget {
  final String? url;
  final String? titleData;
  final String? date;

  const NewsComponentAnotherStyle({
    super.key,
    this.url,
    this.titleData,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              url ?? "https://demofree.sirv.com/nope-not-here.jpg",
              width: double.infinity,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
              TextCustom(
                data: titleData ?? "",
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
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
        ],
      ),
    );
  }
}
