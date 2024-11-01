import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pit_box/core/constant/custom_icons.dart';
import 'package:pit_box/core/constant/size.dart';
import 'package:pit_box/core/constant/colors.dart';
import 'package:pit_box/core/constant/sized_box.dart';
import 'package:pit_box/features/feed_section/domain/entities/load_news_details.dart';
import 'package:pit_box/features/feed_section/presentation/pages/news_detailed_screen.dart';
import 'package:pit_box/features/feed_section/presentation/scrape_bloc/scrape_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  width: size.width * 0.95,
                  height: size.height * 0.21,
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(bRadius10)),
                  child: Padding(
                    padding: const EdgeInsets.all(bRadius5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 6,
                              child: FittedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: bRadius10),
                                      child: Text(
                                        '02 - 04 JUN',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: bRadius10),
                                      child: Text(
                                        'SPAIN 2023',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: bRadius10),
                                      child: Text(
                                        'PRACTICE 3',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: bRadius5),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: bRadius5),
                                                child: Text(
                                                  '02',
                                                  style: TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        255, 255, 0, 0),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'HRS',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            ':',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                          Column(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: bRadius5),
                                                child: Text(
                                                  '23',
                                                  style: TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        255, 255, 0, 0),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'MIN',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            ':',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                          Column(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: bRadius5),
                                                child: Text(
                                                  '37',
                                                  style: TextStyle(
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        255, 255, 0, 0),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'SEC',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.all(bRadius10),
                                child: SizedBox(
                                  height: size.width * 0.36,
                                  width: size.width * 0.4,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Image.asset(
                                        'assets/images/spaintrack.png'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     Flexible(
              //       flex: 1,
              //       child: Container(
              //         color: Colors.red,
              //         height: 100,
              //       ),
              //     ),
              //     Flexible(
              //       flex: 2,
              //       child: Container(
              //         color: Colors.green,
              //         height: 100,
              //       ),
              //     ),
              //     Flexible(
              //       flex: 5,
              //       child: Container(
              //         color: Colors.blue,
              //         height: 100,
              //       ),
              //     ),
              //   ],
              // ),
              BlocBuilder<ScrapeBloc, ScrapeState>(
                builder: (context, state) {
                  if (state is ScrapeDataLoadingState) {
                    context.read<ScrapeBloc>().add(LoadScrapeDataEvent());
                    return Column(
                        children: List.generate(
                      3,
                      (index) => Column(
                        children: [
                          hBox20,
                          Shimmer(
                            child: Container(
                              width: size.width * 0.90,
                              height: size.height * 0.23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context)
                                    .secondaryHeaderColor
                                    .withOpacity(
                                      0.1,
                                    ),
                              ),
                            ),
                          ),
                          hBox12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: size.width * 0.05),
                                child: Shimmer(
                                  child: Container(
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context)
                                          .secondaryHeaderColor
                                          .withOpacity(
                                            0.1,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          hBox5,
                          Shimmer(
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context)
                                    .secondaryHeaderColor
                                    .withOpacity(
                                      0.1,
                                    ),
                              ),
                            ),
                          ),
                          hBox12,
                        ],
                      ),
                    ));
                  }
                  if (state is ScrapeDataErrorState) {
                    return Center(
                      child: Text(state.error),
                    );
                  }
                  if (state is ScrapeDataLoadedState) {
                    final newsDataList = state.newsFeedData;
                    final newsDetailsHiveList = state.newsDetailsDataList;

                    bool hasMatchingHeadline(int index) {
                      return newsDetailsHiveList.any((newsDetails) {
                        return newsDetails.newsDetails?.headLine ==
                            newsDataList[index].headLine;
                      });
                    }

                    return Column(
                      children: List.generate(
                        newsDataList.length,
                        (index) => GestureDetector(
                          onTap: () async {
                            LoadNewsDetails? matchingNewsDetails;
                            for (var newsDetails in newsDetailsHiveList) {
                              if (newsDetails.newsDetails?.headLine ==
                                  newsDataList[index].headLine) {
                                matchingNewsDetails = newsDetails.newsDetails!;
                              }
                            }

                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailedScreen(
                                    headLine: newsDataList[index].headLine!,
                                    imageUrl: newsDataList[index].imageUrl!,
                                    articleLink:
                                        newsDataList[index].articleLink!,
                                    index: index,
                                    alreadyLoaded: hasMatchingHeadline(index),
                                    matchingNewsDetails:
                                        hasMatchingHeadline(index)
                                            ? matchingNewsDetails
                                            : null,
                                    onUpdate: () {
                                      context
                                          .read<ScrapeBloc>()
                                          .add(LoadScrapeDataEvent());
                                    }),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: IntrinsicHeight(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(bRadius10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Hero(
                                          tag:
                                              'image_${newsDataList[index].imageUrl!}',
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor
                                                  .withOpacity(0.2),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  newsDataList[index].imageUrl!,
                                              placeholder: (context, url) =>
                                                  Shimmer(
                                                child: Container(
                                                  height: size.height * 0.23,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor
                                                        .withOpacity(
                                                          0.1,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Center(
                                                child: Row(
                                                  children: [
                                                    const Icon(Icons.error),
                                                    Text(error.toString()),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.025),
                                          child: SvgPicture.asset(
                                            'assets/images/f1_logo.svg',
                                            width: 70,
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .secondaryHeaderColor,
                                                BlendMode.srcIn),
                                            // color: Theme.of(context)
                                            //     .secondaryHeaderColor,
                                          ),
                                        )
                                      ],
                                    ),
                                    hBox5,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: bRadius10),
                                      child: Text(
                                        newsDataList[index].headLine!,
                                        style: const TextStyle(
                                            fontSize: fsize15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    hBox12,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return const Center(child: Text("Bloc Didnt Load"));
                },
              ),
              Container(
                width: size.width * 0.95,
                height: size.height * 0.52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).canvasColor),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(bRadius10),
                          child: CircleAvatar(),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Muhammed Bilal',
                              style: TextStyle(
                                  fontSize: fsize15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '@maxhater07',
                              style: TextStyle(
                                  fontSize: fsize12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.12, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colorgreen),
                            width: size.width * 0.24,
                            height: size.width * 0.07,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'FOLLOW',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(bRadius10),
                      child: Text(
                        'F1 announces the cancellation of the Emilia Romagna Grand Prix',
                        style: TextStyle(
                            fontSize: fsize15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: bRadius10, left: bRadius10, right: bRadius10),
                      child: SizedBox(
                        width: size.width * 0.9,
                        height: size.width * 0.55,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/newsimg.png')),
                      ),
                    ),
                    hBox12,
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: CustomIcons.like),
                        SizedBox(
                          width: size.width * 0.03,
                          child: const Text(
                            '1',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          child: IconButton(
                              onPressed: () {}, icon: CustomIcons.dislike),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                          child: const Text(
                            '2',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: CustomIcons.comment),
                        const Text(
                          '32',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
