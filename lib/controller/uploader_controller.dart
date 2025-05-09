import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploaderController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  var imageOne = Rxn<File>();
  var imageTwo = Rxn<File>();
  var imageThree = Rxn<File>();
  var imageFour = Rxn<File>();
  var logo = Rxn<File>();
  var cover = Rxn<File>();

  final RxList<String> _images = <String>[].obs;

  List<String> get images => _images;

  set setImages(String newValue) {
    _images.add(newValue);
  }

  final RxString _imageOneUrl = ''.obs;
  final RxString _imageTwoUrl = ''.obs;
  final RxString _imageThreeUrl = ''.obs;
  final RxString _imageFourUrl = ''.obs;
  final RxString _logoUrl = ''.obs;
  final RxString _coverUrl = ''.obs;

  String get imageOneUrl => _imageOneUrl.value;
  String get imageTwoUrl => _imageTwoUrl.value;
  String get imageThreeUrl => _imageThreeUrl.value;
  String get imageFourUrl => _imageFourUrl.value;
  String get logoUrl => _logoUrl.value;
  String get coverUrl => _coverUrl.value;

  set setImageOneUrl(String newValue) {
    _imageOneUrl.value = newValue;
    images.add(newValue);
  }

  set setImageTwoUrl(String newValue) {
    _imageTwoUrl.value = newValue;
    images.add(newValue);
  }

  set setImageThreeUrl(String newValue) {
    _imageThreeUrl.value = newValue;
    images.add(newValue);
  }

  set setImageFourUrl(String newValue) {
    _imageFourUrl.value = newValue;
    images.add(newValue);
  }

  set setLogoUrl(String newValue) {
    _logoUrl.value = newValue;
    images.add(newValue);
  }

  set setCoverUrl(String newValue) {
    _coverUrl.value = newValue;
    images.add(newValue);
  }

  Future<void> pickImage(String type) async {
    final pickImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      if (type == 'one') {
        imageOne.value = File(pickImage.path);
        uploadImageToFirebase('one');
      } else if (type == 'two') {
        imageTwo.value = File(pickImage.path);
        uploadImageToFirebase('two');
      } else if (type == 'three') {
        imageThree.value = File(pickImage.path);
        uploadImageToFirebase('three');
      } else if (type == 'four') {
        imageFour.value = File(pickImage.path);
        uploadImageToFirebase('four');
      } else if (type == 'logo') {
        logo.value = File(pickImage.path);
        uploadImageToFirebase('logo');
      } else if (type == 'cover') {
        cover.value = File(pickImage.path);
        uploadImageToFirebase('cover');
      }
    }
  }

  Future<void> uploadImageToFirebase(String type) async {
    try {
      if (type == 'one' && imageOne.value != null) {
        String filename = 'images/${DateTime.now().millisecondsSinceEpoch}_${imageOne.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance.ref().child(filename).putFile(imageOne.value!);
        setImageOneUrl = await snapshot.ref.getDownloadURL();
        setImages = imageOneUrl;
      } else if (type == 'two' && imageTwo.value != null) {
        String filename = 'images/${DateTime.now().millisecondsSinceEpoch}_${imageTwo.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance.ref().child(filename).putFile(imageTwo.value!);
        setImageTwoUrl = await snapshot.ref.getDownloadURL();
      } else if (type == 'three' && imageThree.value != null) {
        String filename = 'images/${DateTime.now().millisecondsSinceEpoch}_${imageThree.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance.ref().child(filename).putFile(imageThree.value!);
        setImageThreeUrl = await snapshot.ref.getDownloadURL();
      } else if (type == 'four' && imageFour.value != null) {
        String filename = 'images/${DateTime.now().millisecondsSinceEpoch}_${imageFour.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance.ref().child(filename).putFile(imageFour.value!);
        setImageFourUrl = await snapshot.ref.getDownloadURL();
      } else if (type == 'logo' && logo.value != null) {
        String filename = 'images/${DateTime.now().millisecondsSinceEpoch}_${logo.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance.ref().child(filename).putFile(logo.value!);
        setLogoUrl = await snapshot.ref.getDownloadURL();
      } else if (type == 'cover' && cover.value != null) {
        String filename = 'images/${DateTime.now().millisecondsSinceEpoch}_${cover.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance.ref().child(filename).putFile(cover.value!);
        setCoverUrl = await snapshot.ref.getDownloadURL();
      }
    } catch (e) {
      debugPrint("Upload error: $e");
    }
  }
}
