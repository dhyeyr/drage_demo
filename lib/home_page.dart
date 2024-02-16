import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/json_decode.dart';
import 'detail_page.dart';


class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  void initState() {
    var gp = Provider.of<puzz_provider>(context, listen: false);
    gp.loadJson();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var gp = Provider.of<puzz_provider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.grey[400],
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color(0xFFCCAB8C)
            :Color(0xFF946D4A),
        title: Text("Bhagavad Gita",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(
          itemCount: gp.allChapters.length,
          itemBuilder: (context, index) {
            var sample = gp.allChapters[index];
            return ListTile(
              style: ListTileStyle.list,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(
                      chapterNumber: sample.chapterNumber!,
                      // chapter_summary: sample.chapterSummary,
                      // json_path: sample.jsonPath,
                      name: sample.name,
                      verses:sample.image,
                      // verses: sample.verses,
                    );
                  },
                ));
              },
              title: Stack(
                children: [
                  Container(
                      height: 60,
                      width: double.infinity,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Color(0xFFCCAB8C)
                          :Color(0xFF946D4A),
                      // color: Theme.of(context).colorScheme.primary,
                      // color: Theme.of(context).colorScheme.primaryContainer,
                      // color: Color(0xFFCCAB8C),
                      child: Center(
                          child: Text(
                            sample.name ?? "",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(right: 300, top: 15),
                    child: Center(
                      child: Text(
                        "${sample.chapterNumber} .",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              // subtitle: Text("Verses :~ ${sample.versesCount}"),
            );
          },
        ),
      ),
    );
  }
}
