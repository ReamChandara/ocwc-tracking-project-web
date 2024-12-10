
class RecruiterModels {
  List<RecruiterData> data;
  Links links;
  Meta meta;

  RecruiterModels({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory RecruiterModels.fromJson(Map<String, dynamic> json) => RecruiterModels(
        data: List<RecruiterData>.from(
            json['data'].map((x) => RecruiterData.fromJson(x))),
        links: Links.fromJson(json['links']),
        meta: Meta.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'links': links.toJson(),
        'meta': meta.toJson(),
      };
}

class RecruiterData {
  int id;
  String hashId;
  String recruiterCode;
  String code;
  String latinName;
  String khmerName;
  String newPhoto;
  String phoneNumber;
  String pob;
  String gender;
  String issuedDate;
  String expiryDate;

  RecruiterData({
    required this.id,
    required this.hashId,
    required this.recruiterCode,
    required this.code,
    required this.latinName,
    required this.khmerName,
    required this.newPhoto,
    required this.phoneNumber,
    required this.pob,
    required this.gender,
    required this.issuedDate,
    required this.expiryDate,
  });

  factory RecruiterData.fromJson(Map<String, dynamic> json) => RecruiterData(
        id: json['id'],
        hashId: json['hash_id'],
        recruiterCode: json['recruiter_code'],
        code: json['code'],
        latinName: json['latin_name'],
        khmerName: json['khmer_name'],
        newPhoto: json['new_photo'],
        phoneNumber: json['phone_number'],
        pob: json['pob'],
        gender: json['gender'],
        issuedDate: json['issued_date'],
        expiryDate: json['expiry_date'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'hash_id': hashId,
        'recruiter_code': recruiterCode,
        'code': code,
        'latin_name': latinName,
        'khmer_name': khmerName,
        'new_photo': newPhoto,
        'phone_number': phoneNumber,
        'pob': pob,
        'gender': gender,
        'issued_date': issuedDate,
        'expiry_date': expiryDate,
      };
}

class Links {
  String first;
  String last;
  String? prev;
  String? next;

  Links({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json['first'],
        last: json['last'],
        prev: json['prev'],
        next: json['next'],
      );

  Map<String, dynamic> toJson() => {
        'first': first,
        'last': last,
        'prev': prev,
        'next': next,
      };
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
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

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json['current_page'],
        from: json['from'],
        lastPage: json['last_page'],
        links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
        path: json['path'],
        perPage: json['per_page'],
        to: json['to'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'from': from,
        'last_page': lastPage,
        'links': List<dynamic>.from(links.map((x) => x.toJson())),
        'path': path,
        'per_page': perPage,
        'to': to,
        'total': total,
      };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json['url'],
        label: json['label'],
        active: json['active'],
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'label': label,
        'active': active,
      };
}
