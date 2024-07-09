abstract class BaseApiServices {
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getPostFormDataApiResponse(String url, dynamic data);
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> putApiResponse(String url, dynamic data);
  Future<dynamic> getPutwwwFormDataApiResponse(String url, dynamic data); // Add this line
}
