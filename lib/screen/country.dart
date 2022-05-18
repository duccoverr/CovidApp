
import 'package:flutter/material.dart';
import '../services/covid_service.dart';
import 'package:appcuoikhoa/models/country.dart';
import '../models/country_summary.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../screen/country_statictis.dart';

CovidService covidService = CovidService();

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  Future<List<CountryModel>> ?countryList;
  Future <List<CountrySummaryModel>> ?summmaryList;



  final TextEditingController typeAhead = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryList = covidService.getCountryList();
    summmaryList = covidService.getCountrySummary("viet nam");
    // this.typeAhead.text = "Viet Nam";
  }
  List<String> _getSugget(List<CountryModel> list , String query){
List<String> matches = [];

for (var item in list){
  matches.add(item.country);
}
matches.retainWhere((element) => element.toLowerCase().contains(query.toLowerCase().toString()));
return matches;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: countryList,
        builder: (context, dynamic snapshot) {
            if (snapshot.hasError)
              return Center(
                child: Text('Vui lòng kiểm tra kết nối '),
              );
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text('Đang lấy thông tin dữ liệu'),
              );
            default:
              return !snapshot.hasData
                  ? Center(
                child: Text('Không có dữ liệu'),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    child: Text(
                      'Covid trong nước', style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    ),

                  ),
                  TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: typeAhead,
                        decoration: InputDecoration(
                            hintText: 'Nhập tên nước',
                            hintStyle: TextStyle(fontSize: 16),
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,

                              )
                            ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: EdgeInsets.all(20),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 24,right: 16),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 28,
                            ),
                          )
                        )
                    ),
                    suggestionsCallback: (partern){
                      return _getSugget(snapshot.data, partern);

                    },
                    itemBuilder: (context, dynamic suggestion){
                      return  ListTile(
                        title: Text(suggestion),
                      );
                    },
                     transitionBuilder: (context, suggestionBox, controller){
                      return suggestionBox;
                     },
                    onSuggestionSelected: ( dynamic suggetion){
                      this.typeAhead.text = suggetion;
                      setState(() {
                        summmaryList = covidService.getCountrySummary(snapshot.data.firstwhere((element) => element.country == suggetion).slug);
                      });

                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FutureBuilder(future: summmaryList,builder: (context, dynamic snapshot)
                  {
                    if(snapshot.hasData)
                      return Center(child: Text('Vui lòng kiểm tra kết nối'),);
                    switch(snapshot.connectionState){
                      case ConnectionState.waiting:
                        return Center(child:  Text('Đang lấy thông tin dữ liệu'),);
                      default: return !snapshot.hasData?Center(child: Text('Không có dữ liệu'),):
                        CountryStatictis(summaryList: snapshot.data);
                    // Center(child: Text('124'),);
                    }
                  },
                  ),

                ],
              );
          }
        });
  }
}
