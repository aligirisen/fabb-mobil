import 'package:universal_html/html.dart';
import 'package:get/get.dart';

class Incident {
  Incident(
      {required this.name,
      required this.isExpanded,
      required this.userId,
      required this.title,
      required this.incidentId,
      required this.incidentStatus,
      required this.category,
      this.location,
      required this.attachments,
      required this.description,
      this.upvoteCount,
      this.downvoteCount});

  final String name;
  final String userId;
  final String incidentId;
  final String title;
  final String category;
  final String description;
  final Location? location;
  final List attachments;
  final int? upvoteCount;
  final int? downvoteCount;
  final String incidentStatus;
  RxBool isExpanded;

  String get names => name;
  String get userid => userId;
  String get incidentid => incidentId;
  String get titles => title;
  String get categories => category;
  String get descriptions => description;
  Location? get locations => location;
  List get attachment => attachments;
  int? get upvotecount => upvoteCount;
  int? get downvotecount => downvoteCount;
  String get incidentstatus => incidentStatus;
  RxBool get isexpanded => isExpanded;

  Incident setName(String name) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setIsExpanded(RxBool isExpanded) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setUserId(String userId) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setTitle(String title) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setDescription(String description) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setCategory(String category) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setLocation(Location location) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setAttachments(List attachments) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setUpvoteCount(int upvoteCount) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setDownvoteCount(int downvoteCount) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setincidentStatus(String incidentStatus) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }
}
