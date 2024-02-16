// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/json_decode.dart';

class DetailPage extends StatefulWidget {
  int chapterNumber;

  String? name;

  List<String>? verses = [];

  DetailPage({
    Key? key,
    required this.chapterNumber,
    required this.name,
    required this.verses,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    if (widget.verses == null) {
      print("NULL");
    } else {
      print("${widget.verses!.length}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gp = Provider.of<puzz_provider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.grey[400],
      body: Column(
        children: [


          Expanded(
            child: GridView.builder(
              clipBehavior: Clip.antiAlias,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: widget.verses!.length,
              itemBuilder: (context, index) {

                // var sData = data?.search![index];
                // var dat = sData?.poster;
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           ViewMore(
                    //             id: sData!.imdbId,
                    //           ),
                    //     ));
                  },
                  child: Stack(
                    children: [
                      Container(
                          margin:
                          EdgeInsets.all(10),
                          clipBehavior:
                          Clip.antiAlias,
                          decoration:
                          BoxDecoration(
                            borderRadius:
                            BorderRadius
                                .circular(5),
                          ),
                          child: Image.asset(
                            "${widget.verses}",
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          )),
                      // Positioned(
                      //     bottom: 0,
                      //     right: 0,
                      //     child: IconButton(
                      //         onPressed: () {
                      //           value.likeMovie(
                      //               dat);
                      //
                      //           ScaffoldMessenger.of(context).showSnackBar(
                      //               SnackBar(
                      //                   backgroundColor:
                      //                   Colors
                      //                       .pink[50],
                      //                   duration: Duration(
                      //                       milliseconds:
                      //                       200),
                      //                   content:
                      //                   Center(
                      //                     child:
                      //                     Text(
                      //                       "Like Your Movie Successfully",
                      //                       style:
                      //                       TextStyle(color: Colors.white),
                      //                     ),
                      //                   )));
                      //           value.likeIndex(
                      //               index);
                      //         },
                      //         // icon: Icon(
                      //         //   (index ==
                      //         //       value
                      //         //           .index)
                      //         //       ? CupertinoIcons
                      //         //       .heart_fill
                      //         //       : CupertinoIcons
                      //         //       .heart,
                      //         //   color: Colors.red,
                      //         // )
                      //     ))
                    ],
                  ),
                );
              },
            ),
          ),


          // SizedBox(
          //   height: 60,
          // ),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.25,
          //   width: MediaQuery.of(context).size.width * 0.9,
          //   child: Image.asset(
          //     '${widget.verses}',
          //     fit: BoxFit.fill,
          //   ),
          // ),


        ],
      ),
    );
  }
}
