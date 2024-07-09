import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
import 'BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override

  Future<dynamic> getPostFormDataApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add text fields
      data.forEach((key, value) {
        if (value is! File) {
          request.fields[key] = value.toString();
        }
      });

      // Add the image file if available
      if (data['image'] != null && data['image'] is File && (data['image'] as File).existsSync()) {
        request.files.add(await http.MultipartFile.fromPath('image', (data['image'] as File).path));
      }

      // Send the request
      var response = await request.send();
      var responseData = await http.Response.fromStream(response);

      responseJson = returnResponse(responseData);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // @override
  // Future getPostFormDataApiResponse(String url, dynamic data) async {
  //   dynamic responseJson;
  //   try {
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //
  //     // Add text fields
  //     request.fields['title'] = data['title'];
  //     request.fields['lat'] = data['lat'].toString();
  //     request.fields['lon'] = data['lon'].toString();
  //
  //     // Add the image file if available
  //     if (data['image'] != null && data['image'].isNotEmpty) {
  //       request.files.add(await http.MultipartFile.fromPath('image', data['image']));
  //     }
  //
  //     // Send the request
  //     var response = await request.send();
  //     var responseData = await http.Response.fromStream(response);
  //
  //     responseJson = returnResponse(responseData);
  //   } on SocketException {
  //     throw FetchDataException('No Internet Connection');
  //   }
  //   return responseJson;
  // }

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> putApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  @override
  Future<dynamic> getPutwwwFormDataApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      // Convert the map to x-www-form-urlencoded format
      final body = data.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}').join('&');

      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: body,
      ).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with server with status code ${response.statusCode}');
    }
  }
}
