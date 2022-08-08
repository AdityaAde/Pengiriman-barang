import 'package:big/models/data_pengiriman_models.dart';
import 'package:big/models/detail_pengiriman_models.dart';
import 'package:big/models/login_models.dart';

abstract class BaseAuthentication {
  Future<LoginResponseModels> loginAuth(LoginRequestModel requestModel);
  Future<List<DataPengirimanModels>> dataPengiriman(String token);
  Future<DetailPengirimanModels> detailPengiriman(String token, int idOrder);
}
