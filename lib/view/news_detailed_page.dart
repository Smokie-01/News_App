// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/news_container_widget.dart';
class NewsDetailedPage extends StatefulWidget {
  final String imageUrl;
  final String newsDescription;
  final String newsTitle;
  final String content;
  const NewsDetailedPage(
      {
      required this.imageUrl,
      required this.newsDescription,
      required this.newsTitle,
      required this.content});

  @override
  State<NewsDetailedPage> createState() => _NewsDetailedPageState();
}

class _NewsDetailedPageState extends State<NewsDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              NewsContainerWidget(
                imageUrl: widget.imageUrl,
                newsDescription: widget.newsDescription,
                newsTitle: widget.newsTitle,
              ),
              Text(widget.content == "null"? "": widget.content, style: TextStyle(fontSize: 16),)
            ]),
          ),
        ),
      ),
    );
  }
}
