import 'dart:convert';
import 'dart:io';

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
  LocationModel? location;
  String? reportNumber;
  String? title;
  String? userId;
  List<String>? attachments = [];
  int? downvoteCount;
  int? upvoteCount;
  File? image;

  IncidentModel(
      {this.address,
      this.category,
      this.createDate,
      this.description,
      this.incidentId,
      this.incidentStatus,
      this.location,
      this.reportNumber,
      this.attachments,
      this.title,
      this.userId,
      this.downvoteCount,
      this.upvoteCount,
      this.image});

  factory IncidentModel.fromJson(Map<String, dynamic> json) => IncidentModel(
        address: json["address"],
        category: json["category"],
        createDate: json["create_date"],
        description: json["description"],
        incidentId: json["incident_id"],
        incidentStatus: json["incident_status"],
        attachments: json["attachments"],
        location: LocationModel.fromJson(json["location"]),
        reportNumber: json["report_number"],
        title: json["title"],
        userId: json["user_id"],
        downvoteCount: json["downvote_count"],
        upvoteCount: json["upvote_count"],
      );

  Map<String, String> toJson() => {
        "address": address.toString(),
        "category": category.toString(),
        "create_date": createDate.toString(),
        "description": description.toString(),
        "incident_id": incidentId.toString(),
        "incident_status": incidentStatus.toString(),
        "attachments": attachments.toString(),
        "location": location!.toJson().toString(),
        "report_number": reportNumber.toString(),
        "title": title.toString(),
        "user_id": userId.toString(),
        "upvote_count": upvoteCount.toString(),
        "downvote_count": downvoteCount.toString(),
      };
}

class LocationModel {
  double? latitude;
  double? longitude;

  LocationModel({
    this.latitude,
    this.longitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        latitude: json["latitude"] is int
            ? json["latitude"].toDouble()
            : json["latitude"],
        longitude: json["longitude"] is int
            ? json["longitude"].toDouble()
            : json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
