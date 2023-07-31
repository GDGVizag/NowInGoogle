import 'dart:convert';
import 'package:http/http.dart' as http;

class GetPlaceUseCase {
  final http.Client httpClient;
  const GetPlaceUseCase(this.httpClient);
  Future<Map<String, String>?> getAddressFromPincode(String pincode) async {
    try {
      var pincodeApiResult = await httpClient
          .get(Uri.parse("https://api.postalpincode.in/pincode/$pincode"));

      Map<String, dynamic> addressJson = jsonDecode(pincodeApiResult.body)[0];
      if (addressJson["Status"] == "Success") {
        var addressEntityJson = addressJson["PostOffice"].firstWhere(
            (addressEntity) => addressEntity["Division"] != "",
            orElse: () => addressJson["PostOffice"][0]);
        var city = addressEntityJson["Division"];
        var state = addressEntityJson["State"];
        // profileSheetState = ProfileBottomSheetState.LOADING;
        return {"city": city, "state": state};
      } else {
        // print("error, $addressJson");
        // profileSheetState = ProfileBottomSheetState.ERROR;
        // pincodeErrorText = "Oops, incorrect pincode! Please check again.";
        return null;
      }
    } catch (e) {
      // profileSheetState = ProfileBottomSheetState.ERROR;
      return null;
    }
  }
}
