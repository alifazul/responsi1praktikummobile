class ApiUrl {
  static const String baseUrl = 'http://localhost/a2_h1d021005/public';
  static const String listIkan = baseUrl + '/ikan';
  static const String createIkan = baseUrl + '/ikan';
  
  static String updateIkan(int id) {
    return baseUrl + '/ikan/' + id.toString();
    }

  static String showIkan(int id) {
    return baseUrl + '/ikan/' + id.toString();
    }

  static String deleteIkan(int id) {
    return baseUrl + '/ikan/' + id.toString();
    }
}
