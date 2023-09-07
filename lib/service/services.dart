import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:object_api_test/model/slider_model.dart';
import 'package:object_api_test/server/server.dart';

class RemoteServices {
  static final dio = Dio();

// Working fine.......................................
/*
  Future<SliderModel> fetchSlider() async {
    final response = await http
        .get(Uri.parse("https://shopperz.foodking.dev/api/frontend/slider"));
    if (response.statusCode == 200) {
      final data = response.body;
      print("Data = $data");
      return sliderModelFromJson(data);
    }
    return sliderModelFromJson("Empty Data");
  }
*/

// Working fine.......................................
/*
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
*/

// Server Approach..........................................
  Server server = Server();
  Future<Either<String, SliderModel>> fetchSlider() async {
    final response = await server.getRequest(
        endPoint: "https://shopperz.foodking.dev/api/frontend/slider");
    if (response.statusCode == 200) {
      final data = response.data;
      return Right(SliderModel.fromJson(data));
    } else {
      return const Left("Something went wrong");
    }
  }
}

/* 
Note 1: Http and Dio both package working fine consider avobe approaches.
=> dio does not support jsonDecode(). and sliderModelJson() built in JsonDecode(). Thats the reason it will show null check error.
=> http does support jsonDecode(). But here our json start with object. So we are not using any iteration or loops here. 
  - thats why it should be, [ final data = response.data ] instead of [final data = jsonDecode(response.data)].
  - response.data return normal string.
  - jsonDecode(response.data) return a map<String, dynamic> .

*/

/*
Note 2: A new Server Approach is introduced.
  - Here for api calling we will add extra layer(server folder).
  - All of api handling logic will be there.
  - When we need call so many request that time 
    we can define all of our GET,POST,PUT,DELETE Method on a seperate Folder Name (Server or it can be anything).
    It hold all of the try{} catch{} handling logics.
  - It will work [Api start with object ] OR [Api start with list] Both.
  - You can use normal method or functional (Dartz) method here.

 */
