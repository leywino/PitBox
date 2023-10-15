import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as parser;
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:pit_box/features/feed_section/data/models/news_details_hive_model.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/icons/box_icon_icons.dart';
import '../../domain/entities/load_news_details.dart';

class LoadNewsDetailsWidget extends StatefulWidget {
  LoadNewsDetailsWidget({
    super.key,
    required this.headLine,
    required this.articleLink,
    required this.index,
    required this.alreadyLoaded,
    required this.onUpdate,
    this.matchingNewsDetails,
  });

  final String headLine;
  final String articleLink;
  final int index;
  final bool alreadyLoaded;
  final VoidCallback onUpdate;
  LoadNewsDetails? matchingNewsDetails;

  @override
  State<LoadNewsDetailsWidget> createState() => _LoadNewsDetailsWidgetState();
}

Dio dio = Dio();

class _LoadNewsDetailsWidgetState extends State<LoadNewsDetailsWidget> {
  LoadNewsDetails? newsDataList;
  String? headLine;

  @override
  void initState() {
    final newsDetailsBox = NewsDetailsBox.getInstance();
    // final newsDataListEdit = newsDetailsBox.values.toList();
    // log(widget.matchingNewsDetails!.timeString);
    super.initState();
    !widget.alreadyLoaded
        ? getNewsData()
        : newsDataList = widget.matchingNewsDetails;
  }

  final String f1Website = "https://www.formula1.com/";

  getNewsData() async {
    Response<dynamic> response;

    try {
      response = await dio.get('$f1Website${widget.articleLink}');
      final html = parser.parse(response.data);

      List<String?> timeString =
          html.querySelectorAll('time').map((element) => element.text).toList();

      List<String?> headlineList = html
          .querySelectorAll('h1')
          .where((element) => element.querySelector('p > strong > a') == null)
          .map((element) => element.text)
          .toList();

      List<String?> paragraphList = html
          .querySelectorAll(
              'body > div.site-wrapper > main > div.f1-article > div.f1-article--pattern.f1-article--pattern-gray3 > div > div > div.col-lg-8.col-xl-7.offset-xl-1.f1-article--content > div > p')
          .where((element) => element.querySelector('p > strong > a') == null)
          .map((element) => element.text)
          .toList();

      headLine = headlineList.first;

      setState(() {
        newsDataList = LoadNewsDetails(
          timeString: timeString[0]!,
          paragraphList: paragraphList,
          headLine: headLine!,
        );
        addNewsDetailsToBox(timeString[0]!, paragraphList);
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  void addNewsDetailsToBox(
      String timeString, List<dynamic>? paragraphList) async {
    try {
      final newsDetailsBox = NewsDetailsBox.getInstance();
      final newsDataList = newsDetailsBox.values.toList();
      if (newsDataList.length == 7) {
        newsDetailsBox.deleteAt(6);
      }
      await newsDetailsBox.add(NewsDetails(
        newsDetails: LoadNewsDetails(
          timeString: timeString,
          paragraphList: paragraphList!,
          headLine: headLine!,
        ),
        index: widget.index,
      ));
      widget.onUpdate();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (newsDataList == null) {
      return Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: bRadius10),
                  child: Shimmer(
                    child: Container(
                      height: 15,
                      width: 90,
                      color: Theme.of(context)
                          .secondaryHeaderColor
                          .withOpacity(0.1),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: bRadius10),
                  child: Shimmer(
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Theme.of(context)
                          .secondaryHeaderColor
                          .withOpacity(0.1),
                    ),
                  ),
                )
              ],
            ),
            Shimmer(
              child: Container(
                height: size.width * 0.1,
                width: size.width * 0.95,
                color: Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
              ),
            ),
            Column(
                children: List.generate(
              4,
              (index) => Padding(
                padding: const EdgeInsets.all(bRadius10),
                child: Shimmer(
                  child: Container(
                    height: size.width * 0.2,
                    color:
                        Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
                  ),
                ),
              ),
            ))
          ],
        ),
      );
    }

    DateFormat format = DateFormat("d MMMM y", "en_US");
    DateTime dateTime = format.parse(newsDataList!.timeString);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: bRadius10),
              child: Text(
                timeago.format(dateTime),
                style: const TextStyle(
                    fontSize: fsize12, fontWeight: FontWeight.w900),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: bRadius10),
              child: GestureDetector(child: const Icon(BoxIcon.like)),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(bRadius10),
          child: Text(
            widget.headLine,
            style:
                const TextStyle(fontSize: fsize20, fontWeight: FontWeight.w800),
          ),
        ),
        Column(
            children: List.generate(
          newsDataList!.paragraphList.length,
          (index) => Padding(
            padding: const EdgeInsets.all(bRadius10),
            child: Text(
              newsDataList!.paragraphList[index],
              style: const TextStyle(
                  fontSize: fsize15, fontWeight: FontWeight.w400),
            ),
          ),
        ))
      ],
    );
  }
}
