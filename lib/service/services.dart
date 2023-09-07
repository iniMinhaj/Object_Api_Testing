import 'package:dio/dio.dart';
import 'package:object_api_test/model/slider_model.dart';

class RemoteServices {
  static final dio = Dio();
  // Future<SliderModel> fetchSlider() async {
  //   final response = await http
  //       .get(Uri.parse("https://shopperz.foodking.dev/api/frontend/slider"));
  //   if (response.statusCode == 200) {
  //     final data = response.body;
  //     print("Data = $data");
  //     return sliderModelFromJson(data);
  //   }
  //   return sliderModelFromJson("Empty Data");
  // }

  Future<SliderModel> fetchSlider() async {
    final response =
        await dio.get("https://shopperz.foodking.dev/api/frontend/slider");
    if (response.statusCode == 200) {
      final data = response.data;
      print("Data = $data");
      return SliderModel.fromJson(data);
    }
    return sliderModelFromJson("Empty Data");
  }
}

/* 
Note: Http and Dio both package working fine consider avobe approaches.
=> dio does not support jsonDecode(). and sliderModelJson() built in JsonDecode(). Thats the reason it will show null check error.
=> http does support jsonDecode(). But here our json start with object. So we are not using any iteration here. 
  - thats why should be, [ final data = response.data ] instead of [final data = jsonDecode(response.data)].
  - response.data return normal string.
  - jsonDecode(response.data) return a map<String, dynamic> .

*/
