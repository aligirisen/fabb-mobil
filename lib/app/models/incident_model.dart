import 'dart:html';

class IncidentModel {
  final String userId;
  final String incidentId;
  final String title;
  final String category;
  final String description;
  final Location location;
  final List attachments;
  final int upvoteCount;
  final int downvoteCount;
  final String incidentStatus;

  IncidentModel(
      {required this.userId,
      required this.title,
      required this.incidentId,
      required this.incidentStatus,
      required this.category,
      required this.location,
      required this.attachments,
      required this.description,
      required this.upvoteCount,
      required this.downvoteCount});

  String get userid => userId;
  String get incidentid => incidentId;
  String get title_ => title;
  String get category_ => category;
  String get description_ => description;
  Location get location_ => location;
  List get attachments_ => attachments;
  int get upvotecount => upvoteCount;
  int get downvotecount => downvoteCount;
  String get incidentstatus => incidentStatus;

  IncidentModel setUserId(String userId) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }

  IncidentModel setincidentId(String incidentId) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }

  IncidentModel setTitle(String title_) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title_,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }

  IncidentModel setCategory(String category_) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title,
        category: category_,
        description: description,
        location: location,
        attachments: attachments,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }

  IncidentModel setDescription(String description_) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title,
        category: category,
        description: description_,
        location: location,
        attachments: attachments,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }

  IncidentModel setLocation(Location location_) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title,
        category: category,
        description: description,
        location: location_,
        attachments: attachments,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }

  IncidentModel setAttachments(List attachments_) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments_,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }

  IncidentModel setUpvoteCount(int upvoteCount) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }

  IncidentModel setDownvoteCount(int downvoteCount) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }

  IncidentModel setIncidentStatus(String incidentStatus) {
    return IncidentModel(
        userId: userId,
        incidentId: incidentId,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount,
        incidentStatus: incidentStatus);
  }
}
