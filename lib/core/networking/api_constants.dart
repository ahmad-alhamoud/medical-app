
class ApiConstants {
      static const String apiBaseUrl = "http://192.168.1.106:1337/api/" ;
  static const String login = "auth/local" ;
  static const String signup = "auth/local/register";
  static const String contactUs = "contact-forms" ;

  static const String imageBase = "http://192.168.105.25:1337";
  static const allBlogs = 'blogs?&fields[0]=title&populate[mainImage][fields][0]=name&populate[mainImage][fields][1]=url&populate[paragraph][fields][0]=title&populate[paragraph][fields][1]=content' ;

  static const String sessions = 'patient-profiles/1?fields[0]=id&populate[sessions][fields][1]=*';
  static const String diseases = 'patient-profiles/1?fields[0]=id&populate=diseases';
}



class ApiErrors {

  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";

}