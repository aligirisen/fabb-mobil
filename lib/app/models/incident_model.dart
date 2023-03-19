import 'dart:html';

class incident_model {
  final String user_id;
  final String incident_id;
  final String title;
  final String category;
  final String description;
  final Location location;
  final List attachments;
  final int upvote_count;
  final int downvote_count;
  final String incident_status;

  incident_model(
      {required this.user_id,
      required this.title,
      required this.incident_id,
      required this.incident_status,
      required this.category,
      required this.location,
      required this.attachments,
      required this.description,
      required this.upvote_count,
      required this.downvote_count});

  String get userId => user_id;
  String get incidentId => incident_id;
  String get title_ => title;
  String get category_ => category;
  String get description_ => description;
  Location get location_ => location;
  List get attachments_ => attachments;
  int get upvoteCount => upvote_count;
  int get downvoteCount => downvote_count;
  String get incidentStatus => incident_status;

  incident_model setUserId(String userId) {
    return incident_model(
        user_id: userId,
        incident_id: incident_id,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvote_count: upvote_count,
        downvote_count: downvote_count,
        incident_status: incident_status);
  }

  incident_model setIncidentId(String incidentId) {
    return incident_model(
        user_id: user_id,
        incident_id: incidentId,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvote_count: upvote_count,
        downvote_count: downvote_count,
        incident_status: incident_status);
  }

  incident_model setTitle(String title_) {
    return incident_model(
        user_id: user_id,
        incident_id: incident_id,
        title: title_,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvote_count: upvote_count,
        downvote_count: downvote_count,
        incident_status: incident_status);
  }

  incident_model setCategory(String category_) {
    return incident_model(
        user_id: user_id,
        incident_id: incident_id,
        title: title,
        category: category_,
        description: description,
        location: location,
        attachments: attachments,
        upvote_count: upvote_count,
        downvote_count: downvote_count,
        incident_status: incident_status);
  }

  incident_model setDescription(String description_) {
    return incident_model(
        user_id: user_id,
        incident_id: incident_id,
        title: title,
        category: category,
        description: description_,
        location: location,
        attachments: attachments,
        upvote_count: upvote_count,
        downvote_count: downvote_count,
        incident_status: incident_status);
  }

  incident_model setLocation(Location location_) {
    return incident_model(
        user_id: user_id,
        incident_id: incident_id,
        title: title,
        category: category,
        description: description,
        location: location_,
        attachments: attachments,
        upvote_count: upvote_count,
        downvote_count: downvote_count,
        incident_status: incident_status);
  }

  incident_model setAttachments(List attachments_) {
    return incident_model(
        user_id: user_id,
        incident_id: incident_id,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments_,
        upvote_count: upvote_count,
        downvote_count: downvote_count,
        incident_status: incident_status);
  }

  incident_model setUpvoteCount(int upvoteCount) {
    return incident_model(
        user_id: user_id,
        incident_id: incident_id,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvote_count: upvoteCount,
        downvote_count: downvote_count,
        incident_status: incident_status);
  }

  incident_model setDownvoteCount(int downvoteCount) {
    return incident_model(
        user_id: user_id,
        incident_id: incident_id,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvote_count: upvote_count,
        downvote_count: downvoteCount,
        incident_status: incident_status);
  }

  incident_model setIncidentStatus(String incidentStatus) {
    return incident_model(
        user_id: user_id,
        incident_id: incident_id,
        title: title,
        category: category,
        description: description,
        location: location,
        attachments: attachments,
        upvote_count: upvote_count,
        downvote_count: downvote_count,
        incident_status: incidentStatus);
  }
}
