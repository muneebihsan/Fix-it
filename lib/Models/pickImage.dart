import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:async';
class pickuploadingImage
{
  final image = ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxHeight: 512,
    maxWidth: 512,
    imageQuality: 75,
  );
  Reference ref = FirebaseStorage.instance.ref().child('profilePic.jpg');

Future pickupLoadingImage() async {

  await ref.putFile(File(image.toString()));
  ref.getDownloadURL().then((value) => {print(value)});
}
}