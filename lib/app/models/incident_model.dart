// To parse this JSON data, do
//
//     final incidentModel = incidentModelFromJson(jsonString);

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
  VoteCounts? voteCounts;

  IncidentModel({
    this.address,
    this.category,
    this.createDate,
    this.description,
    this.incidentId,
    this.incidentStatus,
    this.key,
    this.location,
    this.reportNumber,
    this.title,
    this.userId,
    this.voteCounts,
  });

  factory IncidentModel.fromJson(Map<String, dynamic> json) => IncidentModel(
        address: json["address"],
        category: json["category"],
        createDate: json["create_date"],
        description: json["description"],
        incidentId: json["incident_id"],
        incidentStatus: json["incident_status"],
        key: json["key"],
        location: Location.fromJson(json["location"]),
        reportNumber: json["report_number"],
        title: json["title"],
        userId: json["user_id"],
        voteCounts: VoteCounts.fromJson(json["vote_counts"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "category": category,
        "create_date": createDate,
        "description": description,
        "incident_id": incidentId,
        "incident_status": incidentStatus,
        "key": key,
        "location": location!.toJson(),
        "report_number": reportNumber,
        "title": title,
        "user_id": userId,
        "vote_counts": voteCounts!.toJson(),
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

class VoteCounts {
  int? downvoteCount;
  int? upvoteCount;

  VoteCounts({
    this.downvoteCount,
    this.upvoteCount,
  });

  factory VoteCounts.fromJson(Map<String, dynamic> json) => VoteCounts(
        downvoteCount: json["downvote_count"],
        upvoteCount: json["upvote_count"],
      );

  Map<String, dynamic> toJson() => {
        "downvote_count": downvoteCount,
        "upvote_count": upvoteCount,
      };
}
