import '../../utils/date_time_formatter.dart';

class Wineries {
  int? id;
  String? wineryName;
  String? wineryAbout;
  String? wineryTags;
  String? wineryImage;
  String? startTime;
  String? endTime;


  Wineries(
      {this.id,
        this.wineryName,
        this.wineryAbout,
        this.wineryTags,
        this.wineryImage, this.endTime, this.startTime});

  Wineries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wineryName = json['wineryName'];
    wineryAbout = json['wineryAbout'];
    wineryTags = json['wineryTags'];
    wineryImage = json['wineryImage'];
    endTime = DateTimeFormatter.showTime(json['endTime']);
    startTime = DateTimeFormatter.showTime(json['startTime']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['wineryName'] = wineryName;
    data['wineryAbout'] = wineryAbout;
    data['wineryTags'] = wineryTags;
    data['wineryImage'] = wineryImage;
    data['endTime'] = endTime;
    data['startTime'] = startTime;

    return data;
  }
}