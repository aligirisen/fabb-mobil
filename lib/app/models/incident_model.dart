import 'dart:convert';

IncidentModel incidentModelFromJson(String str) =>
    IncidentModel.fromJson(json.decode(str));

String incidentModelToJson(IncidentModel data) => json.encode(data.toJson());

class IncidentModel {
  String? address;
  String? category;
  String? createDate;
  String? description;
  String? incidentId;
  String? incidentStatus;
  int? key;
  Location? location;
  String? reportNumber;
  String? title;
  String? userId;
  List<String>? attachments = [];
  int? downvoteCount;
  int? upvoteCount;

  IncidentModel(
      {this.address,
      this.category,
      this.createDate,
      this.description,
      this.incidentId,
      this.incidentStatus,
      this.key,
      this.location,
      this.reportNumber,
      this.attachments,
      this.title,
      this.userId,
      this.downvoteCount,
      this.upvoteCount});

  factory IncidentModel.fromJson(Map<String, dynamic> json) => IncidentModel(
      address: json["address"],
      category: json["category"],
      createDate: json["create_date"],
      description: json["description"],
      incidentId: json["incident_id"],
      incidentStatus: json["incident_status"],
      key: json["key"],
      attachments: json["attachments"],
      location: Location.fromJson(json["location"]),
      reportNumber: json["report_number"],
      title: json["title"],
      userId: json["user_id"],
      downvoteCount: json["downvote_count"],
      upvoteCount: json["upvote_count"]);

  Map<String, dynamic> toJson() => {
        "address": address,
        "category": category,
        "create_date": createDate,
        "description": description,
        "incident_id": incidentId,
        "incident_status": incidentStatus,
        "key": key,
        "attachments": attachments,
        "location": location!.toJson(),
        "report_number": reportNumber,
        "title": title,
        "user_id": userId,
        "upvote_count": upvoteCount,
        "downvote_count": downvoteCount,
      };
}

class Location {
  int? latitude;
  int? longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
