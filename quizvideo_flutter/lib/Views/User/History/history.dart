import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/Database/quiz_result_controller.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/center_text_message.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';
import 'package:quizvideo_flutter/Views/Widgets/loading.dart';

import 'Widgets/quiz_result_row.dart';

class HistoricalResults extends StatefulWidget {
  const HistoricalResults({super.key});

  @override
  State<HistoricalResults> createState() => _HistoricalResultsState();
}

class _HistoricalResultsState extends State<HistoricalResults> with StateTools {
  (List<QuizResult>?, DbException?) data = (null, null);
  final qrc = QuizResultController();

  fetchData() async {
    data = await run(() => qrc.getAll());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        body: Column(
          children: [
            const GlobalAppBar(title: "Historical Results"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    }

                    if (snapshot.hasError) {
                      return CenterTextMessage(snapshot.error.toString());
                    }

                    if (data.$2 != null || data.$1 == null) {
                      return CenterTextMessage(data.$2?.message ?? "Something went wrong");
                    }

                    if (data.$1 != null) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.2),
                                  blurRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              border: Border.all(
                                width: 2,
                                color: darkGreyColor2.withOpacity(.2),
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            width: context.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Results: ${data.$1!.length}",
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: darkGreyColor2,
                                  ),
                                ),
                                10.h,
                                Text(
                                  "Correct Count: ${data.$1!.fold(0, (value, element) => value + element.correctCount)}",
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: darkGreyColor2,
                                  ),
                                ),
                                10.h,
                                Text(
                                  "Wrong Count: ${data.$1!.fold(0, (value, element) => value + element.wrongCount)}",
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: darkGreyColor2,
                                  ),
                                ),
                                10.h,
                                Text(
                                  "Skipped Count: ${data.$1!.fold(0, (value, element) => value + element.point)}",
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: darkGreyColor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          10.h,
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => 10.h,
                              itemCount: data.$1!.length,
                              itemBuilder: (context, index) {
                                return QuizResultRow(result: data.$1![index]);
                              },
                            ),
                          ),
                        ],
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
