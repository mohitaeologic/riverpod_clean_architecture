
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../domain/repository/auth_repo.dart';
import '../utils/app_service.dart';

class AuthenticationImpl implements Authentication{

  @override
  login({required String username,required String password,required String clientCode}) async {
    var uri = Uri.parse("https://${clientCode}.com/api/");
    var body = {
      "username": username,
      "password": password,
    };
    //here the api comes
    try {
      var response = await http
          .post(uri, body: body);
      if (response != null) {
      }
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  signUp({required String username,required String password}){
    //here the api comes
  }


  dynamic _processResponse(http.Response response,{BuildContext? context}) {
    var responseJson = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 400:
        {
          if(context != null)
            print(responseJson["message"]);
          throw BadRequestException(
              responseJson["message"], response.request!.url.toString());
        }
      case 401:
        throw SessionOverException(
          'Session over',
        );
      case 403:
        throw UnAuthorizedException(
            responseJson["message"], response.request!.url.toString());
      case 422:
        throw BadRequestException(
            responseJson["message"], response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }

}