import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/error.dart';
import 'package:news_api_flutter_package/model/source.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';
import 'package:provider/provider.dart';
import 'package:quantum_internship/provider/provider_function.dart';
import 'package:quantum_internship/screens/downloaded_article.dart';
import 'package:quantum_internship/screens/login_signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final NewsAPI newsAPI = NewsAPI("4357a87c8af4482b855fdd7e0f6d614c");
// final NewsAPI newsAPI = NewsAPI("88bb86d0cf564075b8b5fd7b2c2f8936");

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  //s4.reference for our box

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // void initState() {
  //   context.read<Movementfun>().titlebox.clear();
  //   context.read<Movementfun>().descbox.clear();
  //   context.read<Movementfun>().sourcebox.clear();
  //   super.initState();
  // }

  Widget buildTopHeadlines() {
    return FutureBuilder<List<Article>>(
        future: newsAPI.getTopHeadlines(country: "us"),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? buildArticleListView(snapshot.data!)
                  : buildError(snapshot.error as ApiError)
              : buildProgress();
        });
  }

  Widget buildEverything() {
    return FutureBuilder<List<Article>>(
        future: context.watch<Movementfun>().searchController.text.isNotEmpty
            ? newsAPI.getEverything(
                query: context.watch<Movementfun>().searchController.text)
            : newsAPI.getEverything(query: "trending"),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? buildArticleListView(snapshot.data!)
                  : buildError(snapshot.error as ApiError)
              : buildProgress();
        });
  }

  Widget buildArticleListView(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        Article article = articles[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("By-"),
                            Text(
                              article.source.name.toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 214, 1, 1),
                              ),
                            ),
                          ],
                        ),

                        InkWell(
                          onTap: () {
                            // context.read<Movementfun>().change();
                            if (context
                                    .read<Movementfun>()
                                    .titlebox
                                    .toMap()
                                    .containsValue(article.title) ==
                                false) {
                              context.read<Movementfun>().titlebox.put(
                                  context.read<Movementfun>().titlebox.length,
                                  article.title);
                              context.read<Movementfun>().sourcebox.put(
                                    context
                                        .read<Movementfun>()
                                        .sourcebox
                                        .length,
                                    article.source.name,
                                  );
                              context.read<Movementfun>().descbox.put(
                                    context.read<Movementfun>().descbox.length,
                                    article.description,
                                  );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Already Saved')));
                            }
                          },
                          // icon: context.watch<Movementfun>().iconchange
                          //     ? Icon(Icons.check)
                          //     : Icon(Icons.add_box),
                          child: Container(
                            color: context
                                    .read<Movementfun>()
                                    .titlebox
                                    .toMap()
                                    .containsValue(article.title)
                                ? Colors.green
                                : Colors.red,
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                        // Text(
                        //   "jf",
                        //   style: TextStyle(color: Colors.amber),
                        // )
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(article.title!,
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        maxLines: 2),
                    subtitle: Text(article.description ?? "", maxLines: 3),
                    trailing: article.urlToImage == null
                        ? null
                        : Image.network(
                            cacheWidth: 100,
                            cacheHeight: 100,
                            article.urlToImage!),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSources() {
    return FutureBuilder<List<Source>>(
      future: newsAPI.getSources(),
      builder: (BuildContext context, AsyncSnapshot<List<Source>> snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData
                ? buildSourceListView(snapshot.data!)
                : buildError(snapshot.error as ApiError)
            : buildProgress();
      },
    );
  }

  Widget buildSourceListView(List<Source> sources) {
    return ListView.builder(
      itemCount: sources.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(sources[index].name!),
            subtitle: Text(sources[index].description!),
          ),
        );
      },
    );
  }

  Widget buildProgress() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildError(ApiError error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error.code ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 4),
            Text(error.message!, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              visualDensity: VisualDensity.compact,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              icon: const RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 214, 1, 1),
                ),
              )),
          //   elevation: 0.2,
          backgroundColor: Colors.blue.shade200,
          title: const Center(
            child: Text(
              "Quantum News",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DownloadedScreen()));
                },
                icon: const Icon(Icons.download),
                color: const Color.fromARGB(255, 214, 1, 1),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: context.watch<Movementfun>().searchController,
                decoration: InputDecoration(
                    hintText: "Search The Feed",
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    suffixIcon: const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.tune,
                        size: 30,
                        color: Color.fromARGB(255, 214, 1, 1),
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Color.fromARGB(255, 214, 1, 1),
                    )),
              ),
            ),
            Expanded(
              child: buildEverything(),
            ),
          ],
        ),
      ),
    );
  }
}
