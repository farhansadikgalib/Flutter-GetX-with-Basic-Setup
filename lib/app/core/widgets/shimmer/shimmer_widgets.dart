import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/asset_constants.dart';
import '../app_widgets.dart';
import 'shimmer_base.dart';

class ShimmerWidgets {
  Widget courseCard() {
    return SizedBox(
      height: 215,
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12, bottom: 1),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        spreadRadius: .1,
                        blurRadius: .15,
                        offset: const Offset(0.0, 0.75)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ShimmerBase(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            demoBgFeaturedCourse,
                            height: 95,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        AppWidgets().gapH(6),
                        Container(
                          height: 10,
                          color: Colors.white,
                          width: 60,
                        ),
                        AppWidgets().gapH8(),
                        Container(
                          height: 40,
                          color: Colors.white,
                          width: 160,
                        ),
                        AppWidgets().gapH12(),
                        Container(
                          height: 12,
                          color: Colors.white,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget jobCard() {
    return SizedBox(
      height: 237,
      child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12, bottom: 2),
              child: Container(
                width: 204,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        spreadRadius: .1,
                        blurRadius: .15,
                        offset: const Offset(0.0, 0.75)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: ShimmerBase(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Image.asset(slackIcon),
                            )),
                        AppWidgets().gapH(12),
                        Container(
                          height: 18,
                          color: Colors.white,
                          width: 150,
                        ),
                        AppWidgets().gapH12(),
                        Container(
                          height: 10,
                          color: Colors.white,
                          width: 70,
                        ),
                        AppWidgets().gapH12(),
                        Container(
                          height: 16,
                          color: Colors.white,
                          width: 120,
                        ),
                        AppWidgets().gapH12(),
                        Container(
                          height: 20,
                          color: Colors.white,
                          width: 140,
                        ),
                        AppWidgets().gapH12(),
                        Row(
                          children: [
                            Container(
                              height: 15,
                              color: Colors.white,
                              width: 90,
                            ),
                            AppWidgets().gapW12(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.primaryColor,
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Apply",
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget courseVerticalList() {
    return Expanded(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: .2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ShimmerBase(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              height: 95,
                              width: 98,
                              color: Colors.orange,
                            ),
                          ),
                          AppWidgets().gapW16(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 6, bottom: 6),
                                  child: Text(
                                    "In Progress",
                                  ),
                                ),
                              ),
                              AppWidgets().gapH(4),
                              Container(
                                width: 100,
                                height: 15,
                                color: Colors.amber,
                              ),
                              AppWidgets().gapH(6),
                              Row(
                                children: [
                                  Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.white,
                                      ),
                                      child: Image.asset(courseraIconPng)),
                                  AppWidgets().gapW(6),
                                  Container(
                                    height: 10,
                                    width: 60,
                                    color: Colors.cyan,
                                  ),
                                ],
                              ),
                              AppWidgets().gapH12(),
                              Container(
                                width: 70,
                                height: 10,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets().gapH(12),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 15,
                                color: Colors.orange,
                              ),
                              const Expanded(child: SizedBox()),
                              Container(
                                width: 20,
                                height: 15,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                          AppWidgets().gapH(8),
                          Container(
                            width: double.infinity,
                            height: 10,
                            color: Colors.white,
                          )
                        ],
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
