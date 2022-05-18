class CountrySummaryModel{
  final String Slug;
  // final int confirmed;
  // final int death;
  // final int recovered;
  // final int active;
  // final DateTime date;

  CountrySummaryModel(this.Slug);

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json){
    return CountrySummaryModel(
      json["Countries"]["Slug"],
      // json["Confirmed"],
      // json["Deaths"],
      // json["Recovered"],
      // json["Active"],
      // DateTime.parse(json["Date"]),
    );
  }
}