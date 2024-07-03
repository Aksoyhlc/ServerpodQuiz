import 'package:bootstrap_flutter_plus/bootstrap_flutter_plus.dart';
import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/Database/quiz_result_controller.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/center_text_message.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';
import 'package:quizvideo_flutter/Views/Widgets/loading.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminQuizResultPage extends StatefulWidget {
  const AdminQuizResultPage({
    super.key,
    this.user,
    this.home = false,
  });

  final User? user;
  final bool home;

  @override
  State<AdminQuizResultPage> createState() => _AdminQuizResultPageState();
}

class _AdminQuizResultPageState extends State<AdminQuizResultPage> with StateTools {
  (AdminQuizResult?, DbException?) dbData = (null, null);
  final qr = QuizResultController();
  fetchData() async {
    dbData = await run(() => qr.getAdminResults(userId: widget.user?.id));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        body: Column(
          children: [
            if (!widget.home) GlobalAppBar(title: "${widget.user?.name ?? ""} Quiz Result"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    }

                    if (dbData.$1 == null) {
                      return CenterTextMessage(dbData.$2?.message ?? "Error");
                    }

                    if (dbData.$1!.resultCount.isEmpty) {
                      return const CenterTextMessage("No Data");
                    }

                    return SingleChildScrollView(
                      child: BsContainer(
                        children: [
                          BsRow(
                            wrapSpace: 20,
                            children: [
                              BsCol(
                                sizes: "col-sm-12 col-md-5",
                                child: graphicCard(
                                  series: seriesGenerator(
                                    "result",
                                    title: "${DateTime.now().year} Year Total Result Count",
                                    color: blueColor,
                                  ),
                                ),
                              ),
                              if (widget.user == null)
                                BsCol(
                                  sizes: "col-sm-12 col-md-5",
                                  child: graphicCard(
                                    series: seriesGenerator(
                                      "user",
                                      title: "${DateTime.now().year} Year Total User Count",
                                      color: redColor,
                                    ),
                                  ),
                                ),
                              BsCol(
                                sizes: "col-sm-12 col-md-5",
                                child: graphicCard(
                                  series: seriesGenerator(
                                    "correct_wrong",
                                    title: "${DateTime.now().year} Year Total Correct-Wrong Count",
                                    color: redColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container graphicCard({
    required List<CartesianSeries<dynamic, dynamic>> series,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,

        //title: ChartTitle(text: widget.model.title ?? ""),
        legend: const Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap,
        ),
        // Initialize category axis
        //primaryXAxis: CategoryAxis(),
        primaryXAxis: const CategoryAxis(
          interval: 1,
          maximum: 12,
          minimum: 0,
          autoScrollingMode: AutoScrollingMode.start,
          autoScrollingDelta: 12,
          labelRotation: 290,
        ),
        primaryYAxis: const NumericAxis(
            rangePadding: ChartRangePadding.none,
            axisLine: AxisLine(width: 0),
            majorTickLines: MajorTickLines(size: 0)),

        tooltipBehavior: TooltipBehavior(enable: true),
        series: series,
      ),
    );
  }

  List<ResultData> dataGenerator(String name) {
    List<ResultData> liste = [];
    Map<int, int> list = {};

    if (name == "result") {
      list = dbData.$1!.resultCount;
    } else if (name == "correct") {
      list = dbData.$1!.correctCount;
    } else if (name == "wrong") {
      list = dbData.$1!.wrongCount;
    } else {
      list = dbData.$1!.userCount;
    }

    list.forEach((key, value) {
      liste.add(
        ResultData(
          key,
          value,
        ),
      );
    });

    return liste;
  }

  seriesGenerator(
    String name, {
    required Color color,
    required String title,
  }) {
    List<CartesianSeries<dynamic, dynamic>> list = [];

    if (name == "correct_wrong") {
      list.add(
        LineSeries<ResultData, String>(
          animationDuration: 1000,
          dataSource: dataGenerator("correct"),
          xValueMapper: (ResultData data, _) => data.mounth.toString(),
          yValueMapper: (ResultData data, _) => data.result,
          color: greenColor2,
          name: title,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      );
      list.add(
        LineSeries<ResultData, String>(
          animationDuration: 1000,
          dataSource: dataGenerator("wrong"),
          xValueMapper: (ResultData data, _) => data.mounth.toString(),
          yValueMapper: (ResultData data, _) => data.result,
          color: redColor,
          name: title,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      );
    } else {
      list.add(
        ColumnSeries<ResultData, String>(
          animationDuration: 1000,
          dataSource: dataGenerator(name),
          xValueMapper: (ResultData data, _) => data.mounth.toString(),
          yValueMapper: (ResultData data, _) => data.result,
          color: color,
          name: title,
        ),
      );
    }

    return list;
  }
}

class ResultData {
  final int mounth;
  final int result;
  ResultData(this.mounth, this.result);
}
