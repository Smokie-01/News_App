// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsContainerWidget extends StatefulWidget {
  final String imageUrl;
  final String newsTitle;
  final String newsDescription;
  NewsContainerWidget({
    super.key,
    required this.imageUrl,
    required this.newsTitle,
    required this.newsDescription,
  });

  @override
  State<NewsContainerWidget> createState() => _NewsContainerWidgetState();
}

class _NewsContainerWidgetState extends State<NewsContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: SingleChildScrollView(
          child: Column(children: [
            CachedNetworkImage(
              height: MediaQuery.of(context).size.height * .38,
              width: MediaQuery.of(context).size.width,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
              fit: BoxFit.cover,
              imageUrl: widget.imageUrl,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: MediaQuery.of(context).size.height * .38,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image:DecorationImage(image: imageProvider)
              ),
              );
              },
            
              errorWidget: (context, url, error) => const Center(
                child: Text(
                  "Failed to Load Image",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Text(
              " Title : ${widget.newsTitle}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (widget.newsDescription != "null")
              Text(" Description :${widget.newsDescription}",
                  style: const TextStyle(
                    fontSize: 16,
                  )),
          ]),
        ),
      ),
    );
  }
}
