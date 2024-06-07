import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';
import 'BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {

  @override
  Future getPostApiResponse(String url , dynamic data) async{

    dynamic responseJson ;
    try {

      Response response = await post(
          Uri.parse(url),
          headers: {
            // "Accept": "application/json",
            "Content-Type": "application/json",
          },
          body: jsonEncode(data)
      ).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    }on SocketException {

      throw FetchDataException(' No Internet Connection');
    }

    return responseJson ;
  }



  dynamic returnResponse (http.Response response){

    print(response.statusCode);
    print(response.body);

    switch(response.statusCode){
      case 200:
        print(response.body);

        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
        // throw UnauthorisedException("not found");
      case 401:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorisedException(responseJson['message']);
      case 422:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorisedException(responseJson['message']);
      default:
        throw FetchDataException('Error accrued while communicating with server'+
            'with status code ' +response.statusCode.toString());
    }
  }

}