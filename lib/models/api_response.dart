// Main Dart class structure to parse the JSON
import 'agency_models.dart';

class ApiResponse {
  List<AgencyData> data;
  Links links;
  Meta meta;

  ApiResponse({required this.data, required this.links, required this.meta});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: List<AgencyData>.from(
          json['data'].map((x) => AgencyData.fromJson(x))),
      links: Links.fromJson(json['links']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links(
      {required this.first, required this.last, this.prev, required this.next});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<PageLink> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links:
          List<PageLink>.from(json['links'].map((x) => PageLink.fromJson(x))),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class PageLink {
  dynamic url;
  String label;
  bool active;

  PageLink({this.url, required this.label, required this.active});

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
