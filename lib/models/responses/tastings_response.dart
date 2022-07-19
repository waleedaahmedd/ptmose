import '../../utils/date_time_formatter.dart';

class Tastings {
  int? id;
  String? img;
  String? date;
  String? startTime;
  String? endTime;
  String? tastingName;
  String? merchantName;
  String? locationName;

  Tastings(
      {this.id,
        this.img,
        this.date,
        this.startTime,
        this.endTime,
        this.tastingName,
        this.merchantName,
        this.locationName});

  Tastings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    date =  DateTimeFormatter.showDate(json['date']);
    startTime = DateTimeFormatter.showTime(json['startTime']);
    endTime = DateTimeFormatter.showTime(json['endTime']);
    tastingName = json['tastingName'];
    merchantName = json['merchantName'];
    locationName = json['locationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img'] = img;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['tastingName'] = tastingName;
    data['merchantName'] = merchantName;
    data['locationName'] = locationName;
    return data;
  }
}