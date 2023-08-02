import 'dart:convert';

import 'package:http/http.dart' as http;

import '../server_exception.dart';

abstract class GetPlaceDataSource {
  Future<Map<String, dynamic>> getCityFromPincode(int pinCode);
}

class GetPlaceDataSourceImpl implements GetPlaceDataSource {
  final http.Client client;
  const GetPlaceDataSourceImpl({required this.client});
  @override
  Future<Map<String, dynamic>> getCityFromPincode(int pincode) async {
    var pincodeApiResult = await client
        .get(Uri.parse("https://api.postalpincode.in/pincode/$pincode"));

    if (pincodeApiResult.statusCode == 200) {
      Map<String, dynamic> addressJson = json.decode(pincodeApiResult.body)[0];
      if (addressJson["Status"] == "Success") {
        var addressEntityJson = addressJson["PostOffice"].firstWhere(
            (addressEntity) => addressEntity["Division"] != "",
            orElse: () => addressJson["PostOffice"][0]);
        return addressEntityJson;
      } else {
        throw ServerException(addressJson["Message"]);
      }
    } else {
      throw const ServerException('Server failure.');
    }
  }
}
