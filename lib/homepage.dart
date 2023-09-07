import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_api_test/controller/slider_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SliderController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Test Api with Object"),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.sliderModel.value.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      controller.sliderModel.value.data![index].id.toString(),
                    ),
                  );
                });
      }),
    );
  }
}
