import 'package:carrotmarket_clone/constant/keys.dart';
import 'package:carrotmarket_clone/data/address_model.dart';
import 'package:carrotmarket_clone/utils/logger.dart';
import 'package:dio/dio.dart';

class AddressService {
  Future<AddressModel> searchAddressByStr(String text) async {
    final formData = {
      'key': VWORLD_KEY,
      'request': 'search',
      'size': 30,
      'query': text,
      'type': 'ADDRESS',
      'category': 'ROAD'
    };

    final response = await Dio()
        .get("http://api.vworld.kr/req/search", queryParameters: formData)
        .catchError((e) {
      logger.e(e.message);
    });
    AddressModel addressModel =
        AddressModel.fromJson(response.data["response"]);
    logger.e(addressModel.result!);
    return addressModel;
  }
}
