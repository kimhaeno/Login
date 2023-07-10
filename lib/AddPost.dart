import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoScreen extends StatefulWidget {
  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  File? _image;

  Future<void> _uploadImage() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이미지를 선택해주세요.')),
      );
      return;
    }

    // 이미지 업로드 로직을 추가하십시오.
    // 여기에서는 이미지를 서버로 업로드하고 성공 여부에 따라 스낵바 메시지를 표시합니다.
    try {
      // TODO: 이미지 업로드 로직 추가
      // 예시:
      // 업로드 성공 시:
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('이미지가 성공적으로 업로드되었습니다.')),
      // );
      // 업로드 실패 시:
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('이미지 업로드에 실패했습니다.')),
      // );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('업로드합니다')),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류가 발생했습니다: $e')),
      );
    }
  }

  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();

    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 업로드'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.center,
                  child: _image != null ? Image.file(_image!, fit: BoxFit.cover,) :
                  Text(
                    '이미지를 선택해 주세요!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  height: 400,
                  width: MediaQuery.of(context).size.width - 40,
                  color: Colors.black,

                ),
              ),
              SizedBox(height: 10,),
              rrButton(
                pressFunc: _getImageFromGallery,
                text: '갤러리에서 이미지 선택'
              ),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(height: 10,),
              rrButton(
                pressFunc: _uploadImage,
                text: '게시글 업로드',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class rrButton extends StatelessWidget {
  const rrButton ({
    super.key,
    required this.pressFunc,
    required this.text,
  });

  final void Function() pressFunc;
  final String text;

  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width - 40,
        child: TextButton(
          onPressed: pressFunc,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
