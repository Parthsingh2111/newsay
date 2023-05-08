import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:quantum_internship/provider/provider_function.dart';
import 'package:quantum_internship/screens/home_screen.dart';

class DownloadedScreen extends StatelessWidget {
  const DownloadedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var article = context.read<Movementfun>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 214, 1, 1),
            )),
        //   elevation: 0.2,
        backgroundColor: Colors.blue.shade200,
        title: const Center(
          child: Text(
            "Quantum News",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: article.titlebox.length,
          itemBuilder: (context, index) {
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
                                  article.sourcebox.get(index),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 214, 1, 1),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text(article.titlebox.get(index),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            maxLines: 2),
                        subtitle:
                            Text(article.descbox.get(index) ?? "", maxLines: 3),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
