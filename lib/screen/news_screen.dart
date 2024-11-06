import 'package:flutter/material.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/widgets/news_widgets.dart';
import 'package:provider/provider.dart';
import 'package:news_app/model/news_model.dart';

class newscreen extends StatelessWidget {
  const newscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.newspaper_outlined),
        title: Text(
          "News App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          children: [
            Consumer<newprovider>(
              builder: (context, provider, child) {
                // Check if the data model is loaded
                if (provider.newmod == null || provider.newmod!.task.isEmpty) {
                  // Fetch data if not loaded
                  provider.provdata();
                  return const Center(child: CircularProgressIndicator());
                } else {
                  // Display the total number of messages
                  return Text(
                    "${provider.newmod!.task.length} messages",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
            Expanded(
              child: Consumer<newprovider>(
                builder: (context, provider, child) {
                  var data = provider.newmod?.task;

                  // Display loading indicator if data is null
                  if (data == null || data.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    // Display the list of news items
                    return ListView.separated(
                      itemBuilder: (context, index) => newswidget(
                        title: data[index]["title"],
                        desc: data[index]["description"],
                        img: data[index]["UrlToImage"],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemCount: data.length,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}