import 'package:get/get.dart';

class Message extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      "en_US": {
        "title": "Find Your OCWC information",
        "subTitle": "Enter latin name and date of birth",
        "track": "Search",
        "latin": "Latin Name",
        "date": "Date Of Birth",
        "nameWarning": "Latin name is required.",
        "dateWarning": "Date of birth is required.",
        "dateMatch": "Date of birth is invalid.",
        "workerDetail": "Worker Detail",
        "gender": "Gender",
        "ocwcNo": "OCWC No",
        "khmername": "Khmer Name",
        "latinname": "Latin Name",
        "country": "Country",
        "SenderAgency": "Sender Agency",
        "trackInfo": "OCWC Information",
        "workAddress": "Address work",
        "appbarTitle": "OCWC Tracking",
        "loading": "Loding...",
        "finding": "Finding Data",
        "try": "Try Again",
        "workerpro": "Worker Profile",
        "dateofbirth": "your Date of Birth",
        'workers': "All Workers",
        "cardDate": "Expiration Card",
        "noData": "No Data",
        "issuseDate": "Date of Issuse",
        "expireDate": "Date of Expiry",
        "image": "Image",
        "okay": "Okay",
        "close": "Close",
        "viewcard": "View Card",
        "qrvalidate": "Qr Not valid",
        "findby": "Find Your Information",
        "scancard": "Scan OCWC Card",
        "enterdate": "Enter Name and Date of birth",
        "scancardTitle": "Scan OCWC Card",
        "scansubtitle": "Input Card in front of Camera",
        "validQR": "Invalid QR Code",
        "scanHere": "Scan Card Here",
        "switchCam": "Switch Camera",
        "openimage": "Open Image",
        "scaningmess": "Scanning please wait...",
        "selectprefix": "Select Prefix Code",
        "cardnumbervalidate": "OCWC number is required.",
        "cardnumberlengthvalidate": "OCWC number must 6 digits.",
        "numbercardhint": "Enter a card number last 6 digits",
        "help": "Help?",
        "enternumbercard": "Enter OCWC number card",
        "numbercardtile": "Enter Number Card and Select Prefix Code",
        "workernotfound": "Worker not found.",
        "back": "Back",
        "findocwc": "Find OCWC Information",
        "findagentcy": "Find Agentcy Information",
        "agentcytitle": "Input latin or khmer name",
        "agentcyhint": "Enter Latin or khmer name",
        "agencykhmer": "Agency Khmer Name",
        "agencyName": "Agency Name",
        "agentcylatin": "Agency Latin Name",
        "agencyinfo": "Agency Profile",
        "sendingcountry": "Sending Agency",
        "abreviate": "Name Abreviate",
        "companytin": "Company TIN",
        "agencyemail": "Agency Email",
        "countrycode": "Country Code",
        "phonenumber": "Phone Number",
        "contact": "Contact Owner ",
        "position": "Position",
        "address": "Address",
        "address1": "Address Line 1",
        "address2": "Address Line 2",
        "addresslatin": "Address In Latin",
        "postalcode": "Postal Code",
        "province": "Province",
        "district": "District",
        "commune": "Commune",
        "village": "Village",
        "attachment": "Attachment",
        'winesses': "Winesses",
        "quota": "Quota",
        "prokas": "Prokas",
        "prokasnumber": "Prokas Number",
        "prokasissuse": "Prokas Issuse At",
        "prokasexpire": "Prokas expired At",
        "documenttype": "Document Type",
        "ducumentnumber": "Ducument Number",
        "ducumentissuse": "Ducument Issuse At",
        "documentexpired": "Document Expired At",
        "total": "Total",
        "male": "Male",
        "female": "Female",
        "filetype": "Attacment is Pdf File",
        "clickfile": "Click On pdf Image to see ducument",
        "notfoundAgent": "Agency not found.",
        "companyaddress": "Company Address",
        'or': "Or",
        'agencylist': "Agency List",
      },
      "km_KH": {
        "title": "តាមដានដំណើរការឯកសារ",
        "subTitle": "សូមបញ្ចូលឈ្មោះឡាតាំងនិងថ្ងៃខែឆ្នាំកំណើត",
        "track": "ស្វែងរក",
        "latin": "ឈ្មោះឡាតាំង",
        "date": "ថ្ងៃខែឆ្នាំកំណើត",
        "nameWarning": "ឈ្មោះឡាតាំង តម្រូវអោយបញ្ចូល។",
        "dateWarning": "ថ្ងៃ.ខែ.ឆ្នាំ.កំណើត តម្រូវអោយបញ្ចូល។",
        "dateMatch": "ថ្ងៃ.ខែ.ឆ្នាំ.កំណើត មិនត្រឹមត្រូវ។",
        "workerDetail": "ព័ត៌មាន",
        "gender": "ភេទ",
        "ocwcNo": "លេខបណ្ណ OCWC",
        "khmername": "ឈ្មោះ",
        "latinname": "ឈ្មោះឡាតាំង",
        "country": "ប្រទេស",
        "SenderAgency": "ភ្នាក់ងារ",
        // "trackInfo": "ព័ត៌មាន OCWC",
        "trackInfo": "ដំណើរការឯកសារ",
        "workAddress": "អាសយដ្ឋានការងារ",
        "appbarTitle": "ប្រព័ន្ធតាមដាន OCWC",
        'loading': "សូមរង់ចាំ",
        "finding": "កំពុងស្វែងរក",
        "try": "ព្យាយាមម្តងទៀត",
        "workerpro": "ព័ត៌មានផ្ទាល់ខ្លួន",
        "dateofbirth": "ថ្ងៃខែឆ្នាំកំណើត",
        'workers': "ពលករទាំងអស់",
        "noData": "គ្នានទិន្នន័យ",
        "cardDate": "សុពលភាពបណ្ណ",
        "issuseDate": "កាលបរិច្ឆេទចេញបណ្ណ",
        "expireDate": "កាលបរិច្ឆេទអស់សុពលភាព",
        "image": "រូបភាព",
        "okay": "យល់ព្រម",
        "close": "បិទ",
        "viewcard": "មើលបណ្ណ",
        "qrvalidate": "បណ្ណ ocwc មិនត្រឺមត្រូវ",
        "findby": "ស្វែងរកព័ត៌មានតាមរយៈ",
        "scancard": "ស្កេនបណ្ណ OCWC",
        "enterdate": "បញ្ចូលឈ្មោះនិងថ្ងែខែឆ្នាំកំណើត",
        "scancardTitle": "ស្កេនបណ្ណ",
        "scansubtitle": "ដាក់​បណ្ណស្ថិតនៅខាងមុខអេក្រង់កាមេរ៉ា ដើម្បីស្កេន",
        "validQR": "QR មិនត្រឹមត្រូវ",
        "scanHere": "ដាក់បណ្ណត្រង់នេះ",
        "switchCam": "ប្ដូរកាមេរ៉ា",
        "openimage": "បើករូបភាព",
        "scaningmess": "កំពុងស្វែងរកសូមរងចាំ...",
        "selectprefix": "ជ្រើសរើសកូដ",
        "cardnumbervalidate": "លេខ OCWC តម្រូវអោយបញ្ចូល",
        "cardnumberlengthvalidate": "លេខ OCWC ត្រូវតែមានចំនួន 6 ខ្ទង",
        "numbercardhint": "បញ្ចូលលេខបណ្ណ​ 6 ខ្ទង់ចុងក្រោយ",
        "help": "ជំនួយ ?",
        "enternumbercard": "បញ្ចូលលេខបណ្ណ OCWC",
        "numbercardtile": "សូមបញ្ចូលលេខបណ្ណ OCWC",
        "workernotfound": "ពលករមិនមានក្នុងប្រព័ន្ធទេ",
        "back": "ត្រឡប់ក្រោយ",
        "findocwc": "តាមដានដំណើរការឯកសារ",
        "findagentcy": "ស្វែងរកទីភ្នាក់ងារជ្រើសរើសឯកជន",
        "agentcytitle":
            "បញ្ចូលឈ្មោះទីភ្នាក់ងារជ្រើសរើសឯកជនជាអក្សរឡាតាំង ឬអក្សរខ្មែរ",
        "agentcyhint": "បញ្ចូលឈ្មោះជាអក្សរឡាតាំង ឬអក្សរខ្មែរ",
        "agencykhmer": "ឈ្មោះទីភ្នាក់ងារជ្រើសរើសឯកជនជាអក្សរខ្មែរ",
        "agencyName": "ឈ្មោះទីភ្នាក់ងារជ្រើសរើសឯកជន",
        "agentcylatin": "ឈ្មោះទីភ្នាក់ងារជាឡាតាំង",
        "agencyinfo": "ព័ត៌មានទីភ្នាក់ងារជ្រើសរើសឯកជន",
        "sendingcountry": "ប្រទេសបញ្ចូន",
        "abreviate": "ឈ្មោះអក្សរកាត់",
        "agencyemail": "អុីមែលភ្នាក់ងារ",
        "companytin": "លេខអត្តសញ្ញាណកម្មសារពើពន្ធ",
        "countrycode": "លេខកូដប្រទេស",
        "phonenumber": "លេខទំនាក់ទំនង",
        "contact": "ព័ត៌មានម្ចាស់​​​ ឬ​ នាយកគ្រប់គ្រង",
        "position": "មុខតំណែង",
        "address": "អាសយដ្ឋាន",
        "address1": "អាសយដ្ឋានទី១",
        "address2": "អាសយដ្ឋានទី២",
        "addresslatin": "អាសយដ្ឋានឡាតាំង",
        "postalcode": "លេខ​កូដ​ប្រៃ​ស​ណី​យ",
        "province": "ខេត្ត/ក្រុង",
        "district": "ស្រុក/ខណ្ណ",
        "commune": "ឃុំ/សង្កាត់",
        "village": "ភូមិ",
        "attachment": "ឯកសាភ្ចាប់",
        'winesses': "សាក្សី",
        "quota": "កូតា",
        "prokas": "អាជ្ញាបណ្ណបញ្ចូនលេខ​",
        "prokasnumber": "ប្រកាសលេខ",
        "prokasissuse": "ប្រកាសនៅថ្ងែ",
        "prokasexpire": "ផុតកំណត់នៅថ្ងៃ",
        'documenttype': "ប្រភេទឯកសារ",
        "ducumentnumber": "ឯកសារលេខ",
        "ducumentissuse": "ឯកសារធ្វើនៅថ្ងៃ",
        "documentexpired": "ឯកសារផុតកំណត់នៅថ្ងៃ",
        "total": "ចំនួនសរុប",
        "male": "ប្រុស",
        "female": "ស្រី",
        "filetype": "ឯកាសាភ្ចាប់ជាប្រភេទ Pdf ",
        "clickfile": "ចុចលើរូបភាពដើម្បីបង្ហាញឯកាសា",
        "notfoundAgent": "មិនមានទីភ្នាក់ងារឯកជនក្នុងប្រព័ន្ធទេ",
        "companyaddress": "អាសយដ្ឋានក្រុមហ៊ុន",
        "agencytitle": "ទីភ្នាក់ងារជ្រើសរើសឯកជន",
        'or': "ឬ",
        'agencylist': "បញ្ជីឈ្មោះទីភ្នាក់ងារជ្រើសរើសឯកជនទាំងអស់",
      }
    };
  }
}
