//local url
//const String baseUrl = "http://www.uat.tracking.ocwc.co";

//production url
const String baseUrl = "https://go.tracking.ocwc.co/api/v1";

//search list worker
const String searchWorkerUrl = "/workers/search";
const String searchWorkerQr = "/workers/search-by-qr";
const String cardImage = "/workers/preview-card?id=";

//search one worker
//const String searchWorkerUrl = "/api/v1/workers/search-by-name";

const String xAccessKey =
    'eyJpdiI6Ikh6Nzd4NlBHcnFweDZITWtkcGt6TVE9PSIsInZhbHVlIjoiVW1ETDlDRW82TURLYTBtb3VRV1o5V1VrU0kwV25lN296Skg3ZU8xZHRtZz0iLCJtYWMiOiJhOGY2ZTVlYzdlY2ZhZWIyODM0MzBkMmVhMTc4ZTExMmQ1YzRmYzcwNGM5ODU0OTUzZTIxMmRmYjllZDJmOTEwIiwidGFnIjoiIn0=';
Map<String, String> headers([String lang = "en"]) {
  return {
    'Content-Type': 'application/json',
    "X-Content-Locale": lang,
    'X-Access-Key': xAccessKey
  };
}
// pearl
