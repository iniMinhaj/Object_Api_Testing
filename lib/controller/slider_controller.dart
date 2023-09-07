import 'package:get/get.dart';
import 'package:object_api_test/model/slider_model.dart';
import 'package:object_api_test/service/services.dart';

class SliderController extends GetxController {
  final isLoading = false.obs;
  final sliderModel = SliderModel().obs;
  // Normal Approach.......................

  // Future<void> fetchData() async {
  //   isLoading(true);
  //   final data = await RemoteServices().fetchSlider();
  //   sliderModel.value = data;
  //   isLoading(false);
  // }

// Dartz Approach..........................
  Future<void> fetchData() async {
    isLoading(true);
    final data = await RemoteServices().fetchSlider();
    isLoading(false);
    data.fold((error) => error.toString(), (sliderData) {
      sliderModel.value = sliderData;
    });
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
