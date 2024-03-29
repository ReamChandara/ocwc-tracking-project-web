import 'dart:convert';

WorkerModel parseFromJson(String json) {
  return WorkerModel.fromJson(jsonDecode(json));
}

List<WorkerModel> parseListWorkerFromJson(String json) {
  return List.from(jsonDecode(json).map((item) => WorkerModel.fromJson(item)));
}

class WorkerModel {
  final List<WorkerData> workerData;

  WorkerModel({required this.workerData});

  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    return WorkerModel(
      workerData: List<WorkerData>.from(
        json["data"].map((e) => WorkerData.fromJson(e)),
      ),
    );
  }
}

class WorkerData {
  final int id;
  final String hashcode;
  final String ocwcNo;
  final String photo;
  final FullName fullName;
  final Gender gender;
  final DateOfBirth dob;
  final IssuedDate issuedDate;
  final ExpiredDate expiredDate;
  final SendingAgency sendingAgency;
  final Country country;
  final WorkAddress workAddress;
  final List<Tricking> tricking;

  WorkerData(
      {required this.id,
      required this.hashcode,
      required this.ocwcNo,
      required this.photo,
      required this.fullName,
      required this.gender,
      required this.dob,
      required this.issuedDate,
      required this.expiredDate,
      required this.sendingAgency,
      required this.country,
      required this.workAddress,
      required this.tricking});

  factory WorkerData.fromJson(Map<String, dynamic> json) {
    return WorkerData(
      id: json["id"],
      ocwcNo: json["ocwc_no"],
      hashcode: json['hash_id'],
      photo: json['photo'],
      fullName: FullName.fromJson(json["full_name"]),
      gender: Gender.fromJson(json["gender"]),
      dob: DateOfBirth.fromJson(json["dob"]),
      issuedDate: IssuedDate.fromJson(json["issued_date"]),
      expiredDate: ExpiredDate.fromJson(json['expired_date']),
      sendingAgency: SendingAgency.fromJson(json["sending_agency"]),
      country: Country.fromJson(json["country"]),
      workAddress: WorkAddress.fromJson(json["work_address"]),
      tricking: List<Tricking>.from(
        json["tracking"].map((e) => Tricking.fromJson(e)),
      ),
    );
  }
}

class FullName {
  final String enName;
  final String khName;

  FullName({required this.enName, required this.khName});

  factory FullName.fromJson(Map<String, dynamic> json) {
    return FullName(
      enName: json['en'],
      khName: json['kh'],
    );
  }
}

class Gender {
  final String enName;
  final String khName;

  Gender({required this.enName, required this.khName});

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(
      enName: json['en'],
      khName: json['kh'],
    );
  }
}

class Country {
  final String enName;
  final String khName;

  Country({required this.enName, required this.khName});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      enName: json['en'],
      khName: json['kh'],
    );
  }
}

class SendingAgency {
  final String enName;
  final String khName;

  SendingAgency({required this.enName, required this.khName});

  factory SendingAgency.fromJson(Map<String, dynamic> json) {
    return SendingAgency(enName: json['en'], khName: json['kh']);
  }
}

class DateOfBirth {
  final String enDate;
  final String khDate;

  DateOfBirth({required this.enDate, required this.khDate});

  factory DateOfBirth.fromJson(Map<String, dynamic> json) {
    return DateOfBirth(
      enDate: json['en'],
      khDate: json['kh'],
    );
  }
}

class IssuedDate {
  final String? enIssuedDate;
  final String? khIssuedDate;

  IssuedDate({required this.enIssuedDate, required this.khIssuedDate});

  factory IssuedDate.fromJson(Map<String, dynamic> json) {
    return IssuedDate(
      enIssuedDate: json['en'],
      khIssuedDate: json['kh'],
    );
  }
}

class ExpiredDate {
  final String? enExpiresDate;
  final String? khExpiresDate;

  ExpiredDate({required this.enExpiresDate, required this.khExpiresDate});

  factory ExpiredDate.fromJson(Map<String, dynamic> json) {
    return ExpiredDate(
      enExpiresDate: json['en'],
      khExpiresDate: json['kh'],
    );
  }
}

class WorkAddress {
  final String? enName;
  final String? khName;

  WorkAddress({this.enName, this.khName});

  factory WorkAddress.fromJson(Map<String, dynamic> json) {
    return WorkAddress(enName: json['en'], khName: json['kh']);
  }
}

class Tricking {
  final bool? check;
  final Title title;
  final Date date;
  final Description description;

  Tricking(
      {this.check,
      required this.title,
      required this.date,
      required this.description});

  factory Tricking.fromJson(Map<String, dynamic> json) {
    return Tricking(
        check: json['check'],
        title: Title.fromJson(json['title']),
        date: Date.fromJson(json['date']),
        description: Description.fromJson(json['description']));
  }
}

class Title {
  final String enTitle;
  final String khTilte;

  Title({required this.enTitle, required this.khTilte});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(enTitle: json['en'], khTilte: json['kh']);
  }
}

class Date {
  final String enDate;
  final String khTilte;

  Date({required this.enDate, required this.khTilte});

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(enDate: json['en'], khTilte: json['kh']);
  }
}

class Description {
  final String enDescription;
  final String khDescription;

  Description({required this.enDescription, required this.khDescription});

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(enDescription: json['en'], khDescription: json['kh']);
  }
}
