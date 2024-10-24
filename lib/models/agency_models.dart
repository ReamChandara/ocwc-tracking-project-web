import 'dart:convert';

AgencyModels parseFromJson(String json) {
  return AgencyModels.fromJson(jsonDecode(json));
}

class AgencyModels {
  List<AgencyData> agencydata;
  AgencyData? agencyDetail;
  AgencyModels({
    required this.agencydata,
    this.agencyDetail,
  });

  factory AgencyModels.fromJson(Map<String, dynamic> json) {
    return AgencyModels(
      agencydata: List<AgencyData>.from(
        json['data'].map((e) => AgencyData.fromJson(e)),
      ),
    );
  }

  factory AgencyModels.fromJsonNew(Map<String, dynamic> json) {
    return AgencyModels(
      agencydata: [],
      agencyDetail: AgencyData.fromJson(json["data"]),
    );
  }
}

class AgencyData {
  int id;
  String hashId;
  String agencyId;
  Agency agency;
  Address address;
  Contact contact;
  Quota quota;
  List<Proka> prokas;
  List<Attachment> attachment;

  AgencyData({
    required this.id,
    required this.hashId,
    required this.agencyId,
    required this.agency,
    required this.address,
    required this.contact,
    required this.quota,
    required this.prokas,
    required this.attachment,
  });

  factory AgencyData.fromJson(Map<String, dynamic> json) {
    return AgencyData(
      id: json['id'],
      hashId: json['hash_id'],
      agencyId: json['agency_id'],
      agency: Agency.fromJson(json['agency']),
      address: Address.fromJson(json['address']),
      contact: Contact.fromJson(json['contact']),
      quota: Quota.fromJson(json['quota']),
      prokas: List<Proka>.from(
        json['prokas'].map((e) => Proka.fromJson(e)),
      ),
      attachment: List<Attachment>.from(
        json['attachment'].map((e) => Attachment.fromJson(e)),
      ),
    );
  }
}

class Address {
  dynamic line1;
  dynamic line2;
  dynamic inLatin;
  dynamic postalCode;
  dynamic province;
  dynamic district;
  dynamic commune;
  dynamic village;
  dynamic fullAddress;
  dynamic fullAddressEn;
  Address({
    this.line1,
    this.line2,
    this.inLatin,
    this.postalCode,
    required this.province,
    required this.district,
    required this.commune,
    required this.village,
    required this.fullAddress,
    required this.fullAddressEn,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      line1: json['line_1'],
      line2: json['line_2'],
      inLatin: json['in_latin'],
      postalCode: json['postal_code'],
      province: json['province'],
      district: json['district'],
      commune: json['commune'],
      village: json['village'],
      fullAddress: json['full_address'],
      fullAddressEn: json['full_address_en'],
    );
  }
}

class Agency {
  Country country;
  List<SendingCountry> sendingCountry;
  dynamic khmerName;
  dynamic latinName;
  dynamic nameAbbreviate;
  dynamic agencyEmail;
  dynamic companyTin;
  dynamic countryCode;
  dynamic agencyPhoneNumber;
  dynamic agencyCountryCodeOther;
  dynamic agencyPhoneNumberOther;

  Agency({
    required this.country,
    required this.khmerName,
    required this.latinName,
    required this.nameAbbreviate,
    required this.agencyEmail,
    required this.companyTin,
    required this.countryCode,
    required this.agencyPhoneNumber,
    required this.sendingCountry,
    required this.agencyCountryCodeOther,
    required this.agencyPhoneNumberOther,
  });

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
      country: Country.fromJson(json['country']),
      khmerName: json['khmer_name'],
      latinName: json['latin_name'],
      nameAbbreviate: json['name_abbreviate'],
      agencyEmail: json['agency_email'],
      companyTin: json['company_tin'],
      countryCode: json['country_code'],
      agencyPhoneNumber: json['agency_phone_number'],
      sendingCountry: List<SendingCountry>.from(
        json["sending_country"].map((e) => SendingCountry.fromJson(e)),
      ),
      agencyCountryCodeOther: json['country_code_other'],
      agencyPhoneNumberOther: json['agency_phone_number_other'],
    );
  }
}

class Attachment {
  dynamic documentType;
  dynamic documentNumber;
  dynamic documentIssuedAt;
  dynamic documentExpiredAt;
  dynamic documentPath;

  Attachment({
    required this.documentType,
    required this.documentNumber,
    required this.documentIssuedAt,
    required this.documentExpiredAt,
    required this.documentPath,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      documentType: json['document_type'],
      documentNumber: json['document_number'],
      documentIssuedAt: json['document_issued_at'],
      documentExpiredAt: json['document_expired_at'],
      documentPath: json['document_path'],
    );
  }
}

class Contact {
  dynamic khmerName;
  dynamic latinName;
  Position position;
  dynamic phoneCode;
  dynamic phoneNumber;
  dynamic address;
  dynamic witnesses;

  Contact({
    required this.khmerName,
    required this.latinName,
    required this.position,
    required this.phoneCode,
    required this.phoneNumber,
    required this.address,
    required this.witnesses,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      khmerName: json['khmer_name'],
      latinName: json['latin_name'],
      position: Position.fromJson(json['position']),
      phoneCode: json['phone_code'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      witnesses: json['witnesses'],
    );
  }
}

class Proka {
  Country country;
  dynamic prokasNumber;
  dynamic prokasIssuedAt;
  dynamic prokasExpiredAt;

  Proka({
    required this.country,
    required this.prokasNumber,
    required this.prokasIssuedAt,
    required this.prokasExpiredAt,
  });

  factory Proka.fromJson(Map<String, dynamic> json) {
    return Proka(
      country: Country.fromJson(json['country']),
      prokasNumber: json['prokas_number'],
      prokasIssuedAt: json['prokas_issued_at'],
      prokasExpiredAt: json['prokas_expired_at'],
    );
  }
}

class Position {
  final dynamic khName;
  final dynamic enName;

  Position({required this.khName, required this.enName});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      khName: json['kh'],
      enName: json['en'],
    );
  }
}

class Country {
  final dynamic khmerName;
  final dynamic englishName;

  Country({required this.khmerName, required this.englishName});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(khmerName: json['kh'], englishName: json['en']);
  }
}

class Quota {
  dynamic total;
  dynamic male;
  dynamic female;

  Quota({
    required this.total,
    required this.male,
    required this.female,
  });

  factory Quota.fromJson(Map<String, dynamic> json) {
    return Quota(
      total: json['total'],
      male: json['male'],
      female: json['female'],
    );
  }
}

class SendingCountry {
  final String khmerName;
  final String enName;

  SendingCountry({
    required this.khmerName,
    required this.enName,
  });

  factory SendingCountry.fromJson(Map<String, dynamic> json) {
    return SendingCountry(
      khmerName: json['kh'],
      enName: json['en'],
    );
  }
}
