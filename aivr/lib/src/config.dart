import 'package:flutter_dotenv/flutter_dotenv.dart';

// API RELATED
String apiBaseUrl = dotenv.env['API_BASE_URL'] == null
    ? dotenv.env['API_BASE_URL']!
    : "http://192.168.62.20/api/get_api?";
// String loginUrl = "${baseUrl}act=login";
// String getUserUrl = "${baseUrl}act=get_data_user";
// String getAllFormVisitingUrl = "${baseUrl}act=get_all_form_visiting";

// TEST AND DEBUGGING
bool debugMode = dotenv.env['DEBUG_MODE'] == 'true';
String? testUser = dotenv.env['TEST_USER'];
String? testPassword = dotenv.env['TEST_PASSWORD'];

// APP RELATED
String? appName = dotenv.env['APP_NAME'];
