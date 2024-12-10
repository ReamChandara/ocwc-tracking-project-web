//local url
//const String baseUrl = "http://www.uat.tracking.ocwc.co";

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//production url
const String baseUrl = "https://go.tracking.ocwc.co/api/v1";

//search list worker
const String searchWorkerUrl = "/workers/search";
const String searchWorkerQr = "/workers/search-by-qr";
const String cardImage = "/workers/preview-card?id=";
const String findWorkerNumberCard = "/workers/search-by-ocwc-number";
const String searchAgency = '/agencies/search';
const String listAgencyUrl = "/agencies/list";
const String agencyDetails = '/agencies/detail';
const String findRecruiterUrl = "/recruiters/search";
const String recruiterDetailUrl = "/recruiters/print";
//search one worker
//const String searchWorkerUrl = "/api/v1/workers/search-by-name";

const String xAccessKey =
    'eyJpdiI6Ikh6Nzd4NlBHcnFweDZITWtkcGt6TVE9PSIsInZhbHVlIjoiVW1ETDlDRW82TURLYTBtb3VRV1o5V1VrU0kwV25lN296Skg3ZU8xZHRtZz0iLCJtYWMiOiJhOGY2ZTVlYzdlY2ZhZWIyODM0MzBkMmVhMTc4ZTExMmQ1YzRmYzcwNGM5ODU0OTUzZTIxMmRmYjllZDJmOTEwIiwidGFnIjoiIn0=';
Map<String, String> headers([String lang = "en"]) {
  return {
    'Content-Type': 'application/json',
    "X-Content-Locale": Get.locale == const Locale('en', "US") ? "en" : "kh",
    'X-Access-Key': xAccessKey
  };
}
// pearl
