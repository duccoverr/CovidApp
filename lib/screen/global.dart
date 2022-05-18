import 'package:flutter/material.dart';
import '../services/covid_service.dart';
import '../models/global_summary.dart';
import 'global_statis.dart';
import 'global_loading.dart';

CovidService covidService = CovidService();

class Global extends StatefulWidget {
  const Global({Key? key}) : super(key: key);

  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
   Future<GlobalSummaryModel> ?summary;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    summary = covidService.getGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Covid Thế Giới',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    summary  = covidService.getGlobalSummary();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        FutureBuilder(
          future: summary,
          builder: (context,  dynamic snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text("Vui lòng kiểm tra kết nối"),
              );
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: GlobalLoading(),
                );
              default:
                return !snapshot.hasData
                    ? Center(
                        child: Text('Không có dữ liệu'),)

                    :GlobalStatistics(summary: snapshot.data);
            }
          },
        )
      ],
    );
  }
}
