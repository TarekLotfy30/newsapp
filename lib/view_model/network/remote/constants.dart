//https://newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=API_KEY

//https://newsapi.org/
// v2/top-headlines?              EL PATH HAYB2A MN GHER "?"
// country=us&category=business&apiKey=6daca0ce077440d7b4ffdfda4742e424

//https://newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=6daca0ce077440d7b4ffdfda4742e424

// https://newsapi.org/
// v2/top-headlines
// country=us&category=business&apiKey=6daca0ce077440d7b4ffdfda4742e424

// api of search
// https://newsapi.org/
// v2/everything
// q=tesla&apiKey=6daca0ce077440d7b4ffdfda4742e424

class EndPoints {
  static const String BASE_URL = "https://newsapi.org/";
  static const String NEWS_ENDPOINT = "v2/top-headlines";
  static const String SEARCH_ENDPOINT = "v2/everything";

  static const String apikey = "6daca0ce077440d7b4ffdfda4742e424";
  static const String country = "us";

  //query
  static const Map<String, dynamic> newsQueryBusiness = {
    "country": country,
    "category": "business",
    "apiKey": apikey,
  };
  static const Map<String, dynamic> newsQuerySports = {
    "country": country,
    "category": "sports",
    "apiKey": apikey,
  };
  static const Map<String, dynamic> newsQueryScience = {
    "country": country,
    "category": "science",
    "apiKey": apikey,
  };
}
