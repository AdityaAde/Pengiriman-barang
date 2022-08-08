import 'dart:convert';

import 'package:big/models/data_pengiriman_models.dart';
import 'package:big/models/detail_pengiriman_models.dart';
import 'package:big/models/login_models.dart';
import 'package:big/provider/base_authentication.dart';
import 'package:dio/dio.dart';

class Authentication extends BaseAuthentication {
  @override
  Future<LoginResponseModels> loginAuth(LoginRequestModel requestModel) async {
    var dio = Dio();
    final response = await dio.post('https://dportv2.development-big.com/api_v1/login/loginDriver',
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          },
        ),
        data: jsonEncode(
          requestModel.toJson(),
        ));
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModels.fromJson(response.data);
    } else {
      throw Exception('Failed to load Data');
    }
  }

  @override
  Future<List<DataPengirimanModels>> dataPengiriman(String token) async {
    var dio = Dio();
    try {
      final response = await dio.post('https://dportv2.development-big.com/api_v1/Driver/listBursaPengirimanDriver',
          options: Options(
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Authorization': token,
            },
          ),
          data: jsonEncode(<String, int>{
            "offset": 1,
            "param": 1,
            "limit": 10,
          }));
      if (response.statusCode == 200 || response.statusCode == 400) {
        List<DataPengirimanModels> listData = (response.data as List)
            .map(
              (e) => DataPengirimanModels.fromJson(e),
            )
            .toList();
        return listData;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      return throw Exception(e);
    }
  }

  @override
  Future<DetailPengirimanModels> detailPengiriman(String token, int idOrder) async {
    var dio = Dio();
    try {
      final response = await dio.post('https://dportv2.development-big.com/api_v1/Driver/detail_pengiriman',
          options: Options(
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Authorization': token,
            },
          ),
          data: jsonEncode(
            <String, int>{
              "id_order": idOrder,
            },
          ));
      if (response.statusCode == 200 || response.statusCode == 400) {
        return DetailPengirimanModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      return throw Exception(e);
    }
  }
}
