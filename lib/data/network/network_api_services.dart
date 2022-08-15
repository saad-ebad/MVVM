import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/base_api_services.dart';

class NetworkApiServices extends BaseAPIServices
{
  @override
  Future getGetApiResponse(String? url) async {

    dynamic jsonResponse;
    try
        {
            final response = await dio.Dio().get(url!).timeout(const Duration(seconds: 10));
            jsonResponse = returnResponse(response);
        }
        on SocketException
    {
      throw FetchDataException("No internet Connection");
    }
    return jsonResponse;
  }

  @override
  Future getPostApiResponse(String? url , dynamic data) async {
    dynamic jsonResponse;
    try
    {
      Response response = await dio.Dio().post(url!,data: data ).timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    }
    on SocketException
    {
      throw FetchDataException("No internet Connection");
    }
    return jsonResponse;
  }

  dynamic returnResponse(dio.Response response)
  {
    switch(response.statusCode)
    {
      case 200:
        dynamic jsonResponse =response.data;
        return jsonResponse;

      case 400:
        throw BadRequestException(response.data.toString());
      case 500:
      case 404: throw UnauthorizedException(response.data.toString());
      default:
        throw FetchDataException("Error occurred while communicating with the server " + "with the status code" + response.statusCode.toString());
    }
  }


}