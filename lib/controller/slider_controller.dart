import 'package:get/get.dart';
import 'package:object_api_test/model/slider_model.dart';
import 'package:object_api_test/service/services.dart';

class SliderController extends GetxController {
  final isLoading = false.obs;
  final sliderModel = SliderModel().obs;
  Future<void> fetchData() async {
    isLoading(true);
    final data = await RemoteServices().fetchSlider();
    sliderModel.value = data;
    isLoading(false);
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
