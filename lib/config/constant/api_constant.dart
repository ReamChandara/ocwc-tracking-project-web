const String baseUrl = "http://www.uat.tracking.ocwc.co";
const searchWorkerUrl = "/api/v1/workers/search-by-name";
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