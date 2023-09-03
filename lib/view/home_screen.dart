import 'package:flutter/material.dart';
import 'package:news_app/controller/fetch_data.dart';
import 'package:news_app/model/news_page_model.dart';
import 'package:news_app/view/news_detailed_page.dart';
import 'widgets/news_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<Widget> tabs = [Text("All"), Text("Bussiness"), Text("Tech"), Text("sports")];
  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: tabs.length, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: Column(children: [
        Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent),
                tabs: tabs,
                controller: tabController,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 30),
              ),
            )),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            getNewsByCategory("general"),
           getNewsByCategory("business"),
            getNewsByCategory("technology"),
            getNewsByCategory("sports")
          ]),
        ),
      ]),
    );
  }

  FutureBuilder<NewsPageModel> getNewsByCategory( String category) {
    return FutureBuilder(
            future: ApiServices.fetchNews(category : category),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            NewsContainerWidget(
                              imageUrl: snapshot
                                  .data!.articles![index].urlToImage
                                  .toString(),
                              newsDescription: snapshot
                                  .data!.articles![index].description
                                  .toString(),
                              newsTitle: snapshot.data!.articles![index].title
                                  .toString(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) {
                                        return NewsDetailedPage(
                                            imageUrl: snapshot.data!
                                                .articles![index].urlToImage
                                                .toString(),
                                            newsDescription: snapshot.data!
                                                .articles![index].description
                                                .toString(),
                                            newsTitle: snapshot
                                                .data!.articles![index].title
                                                .toString(),
                                            content: snapshot.data!
                                                .articles![index].content
                                                .toString());
                                      }));
                                    },
                                    child: Text("Read More"))
                              ],
                            )
                          ],
                        ),
                      );
                    });
              }
            }),
          );
  }
}
