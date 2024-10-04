import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';

//changes
class BumpController extends GetxController {
  final loading = true.obs;
  final showLogin = false.obs;
  late Box bumpGallery;

  @override
  void onInit() async {
    super.onInit();
    bumpGallery = await Hive.openBox(Constants.BUMP_GALLERY);

    Timer(const Duration(milliseconds: 50), () {
      loading.value = false;
      addData();
    });
  }

  void addData() {
    if (bumpGallery.length > 0) {
      for (int i = 1; i < bumpGallery.length; i++) {
        if (bumpGallery.getAt(i).toString() == "No data available") {
        } else {}
      }
    } else {
      bumpGallery.put(1, ["No data available"]);
      bumpGallery.put(2, ["No data available"]);
      bumpGallery.put(3, ["No data available"]);
      bumpGallery.put(4, ["No data available"]);
      bumpGallery.put(5, ["No data available"]);
      bumpGallery.put(6, ["No data available"]);
      bumpGallery.put(7, ["No data available"]);
      bumpGallery.put(8, ["No data available"]);
      bumpGallery.put(9, ["No data available"]);
      bumpGallery.put(10, ["No data available"]);
      bumpGallery.put(11, ["No data available"]);
      bumpGallery.put(12, ["No data available"]);
      bumpGallery.put(13, ["No data available"]);
      bumpGallery.put(14, ["No data available"]);
      bumpGallery.put(15, ["No data available"]);
      bumpGallery.put(16, ["No data available"]);
      bumpGallery.put(17, ["No data available"]);
      bumpGallery.put(18, ["No data available"]);
      bumpGallery.put(19, ["No data available"]);
      bumpGallery.put(20, ["No data available"]);
      bumpGallery.put(21, ["No data available"]);
      bumpGallery.put(22, ["No data available"]);
      bumpGallery.put(23, ["No data available"]);
      bumpGallery.put(24, ["No data available"]);
      bumpGallery.put(25, ["No data available"]);
      bumpGallery.put(26, ["No data available"]);
      bumpGallery.put(27, ["No data available"]);
      bumpGallery.put(28, ["No data available"]);
      bumpGallery.put(29, ["No data available"]);
      bumpGallery.put(30, ["No data available"]);
      bumpGallery.put(31, ["No data available"]);
      bumpGallery.put(32, ["No data available"]);
      bumpGallery.put(33, ["No data available"]);
      bumpGallery.put(34, ["No data available"]);
      bumpGallery.put(35, ["No data available"]);
      bumpGallery.put(36, ["No data available"]);
      bumpGallery.put(37, ["No data available"]);
      bumpGallery.put(38, ["No data available"]);
      bumpGallery.put(39, ["No data available"]);
      bumpGallery.put(40, ["No data available"]);
      //bumpGallery.put(41, ["No data available"]);
    }

    loading.value = false;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  Future<void> onImageButtonPressed(int index) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemp = File(image.path).toString();
      //if (imageTemp != null || imageTemp != "")
      print(imageTemp.toString());
      loading.value = true;
      await bumpGallery.put(index + 1, [imageTemp.toString().replaceAll("File:", "").replaceAll("'", "").replaceAll(" ", "")]);
      print(bumpGallery.getAt(index + 1)[0]);
    } catch (e) {}
    loading.value = false;
  }
}
