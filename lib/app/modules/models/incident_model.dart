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
}
