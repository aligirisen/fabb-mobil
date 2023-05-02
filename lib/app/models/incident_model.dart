import 'package:get/get.dart';
import 'package:universal_html/html.dart';

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
      required this.address,
      required this.createDate,
      this.upvoteCount,
      this.downvoteCount});

  final String name;
  final String userId;
  final String incidentId;
  final String title;
  final String address;
  final String category;
  final String description;
  final Location? location;
  final List attachments;
  final DateTime createDate;
  final int? upvoteCount;
  final int? downvoteCount;
  final String incidentStatus;
  RxBool isExpanded;

  String get names => name;
  String get userid => userId;
  String get incidentid => incidentId;
  String get titles => title;
  String get addres => address;
  String get categories => category;
  String get descriptions => description;
<<<<<<< HEAD
  Location get locations => location;
  DateTime get createdate => createDate;
=======
  Location? get locations => location;
>>>>>>> busra
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
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
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setAddress(String address) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }

  Incident setCreateDate(DateTime createDate) {
    return Incident(
        name: name,
        isExpanded: isExpanded,
        userId: userId,
        title: title,
        address: address,
        incidentId: incidentId,
        incidentStatus: incidentStatus,
        category: category,
        location: location,
        createDate: createDate,
        attachments: attachments,
        description: description,
        upvoteCount: upvoteCount,
        downvoteCount: downvoteCount);
  }
}
