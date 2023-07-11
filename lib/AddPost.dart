import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/WearInfo.dart';
import 'package:provider/provider.dart';

class UploadPhotoScreen extends StatefulWidget {
  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class AddPostState extends ChangeNotifier {
  var wearList = List<WearInfo>.empty(growable: true);
  final brandController = TextEditingController();
  final wearController = TextEditingController();
  final bodyController = TextEditingController();
  WearType? selectedWearType;
  final _wearTypes = ['상의', '하의', '신발', '아우터', '액세서리', '모자',];

  void setWearType(WearType t){
    selectedWearType = t;
    notifyListeners();
  }

  void addList(WearInfo info){
    wearList.add(info);
    notifyListeners();
  }

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

    var routeState = context.watch<AddPostState>();
    var wearList = routeState.wearList;
    var selectedWearType = routeState.selectedWearType;

    return ChangeNotifierProvider(
      create: (context) => AddPostState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('게시글 업로드'),
        ),
        body: SingleChildScrollView(
          child: Container(
            //alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                const Text(
                  "착장 업로드",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 400,
                    color: Colors.black12,
                    child: Container(
                      height: 300,
                      alignment: Alignment.center,
                      child: _image != null ? Image.file(_image!, fit: BoxFit.fill,) :
                      const Text(
                        '이미지를 선택해 주세요!',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                ),
                  ),
                const SizedBox(height: 10,),
                rrButton(
                    pressFunc: _getImageFromGallery,
                    text: '갤러리에서 이미지 선택'
                ),
                const SizedBox(height: 10,),
                const Text(
                  "의상 정보",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const SizedBox(height: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.black12,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: wearList.length+1,
                      itemBuilder: (BuildContext context, int index) {
                        if(index == wearList.length){
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                  routeState.setWearType(WearType.top);
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: AddWear(),
                                        backgroundColor: Colors.white,
                                        insetPadding: const EdgeInsets.all(5),
                                        actions: [
                                          ElevatedButton(
                                            style: OutlinedButton.styleFrom(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                              backgroundColor: Colors.greenAccent,
                                              foregroundColor: Colors.black,
                                            ),
                                            onPressed: () {
                                              routeState.addList(WearInfo(
                                                  wearType: routeState
                                                      .selectedWearType!,
                                                  brandName: routeState
                                                      .brandController.text,
                                                  wearName: routeState
                                                      .wearController.text));
                                              Navigator.pop(context);
                                            },
                                            child: const Text("의상 추가"),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                });
                              },
                            child: Container(
                              height: 70,
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.black,
                                  child: Text(
                                    "눌러서 의상을 추가하세요",
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        else{
                          return wearWidget(info: wearList[index]);
                        }
                      }
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  "게시글 본문",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    color: Colors.black12,
                    child: TextField(
                      controller: routeState.bodyController,
                      decoration: InputDecoration(
                        hintText: '자신의 이야기를 마음껏 적어주세요.'
                      ),
                    ),
                  )
                ),
                const SizedBox(height:10),
                rrButton(
                  pressFunc: _uploadImage,
                  text: '게시글 업로드',
                ),
              ],
            ),
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
        width: MediaQuery.of(context).size.width,
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

class wearWidget extends StatelessWidget{
  wearWidget({Key? key, required this.info}) : super(key: key);
  final WearInfo info;

  @override
  Widget build(BuildContext context){
    return Container(
      height: 70,
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: Image.asset(
                  "assets/images/${info.wearType.toString().split('.')[1]}_b.png",
                  fit:BoxFit.fill
                ),
              ),
              Column(
                children: [
                  Text(info.brandName),
                  const SizedBox(height: 10),
                  Text(info.wearName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class AddWear extends StatefulWidget{
  const AddWear({Key? key}) : super(key: key);

  @override
  State<AddWear> createState() => _AddWearState();
}

class _AddWearState extends State<AddWear> {


  @override
  Widget build(BuildContext context) {
    var routeState = context.watch<AddPostState>();
    var wearTypes = routeState._wearTypes;
    var selectedWearType = routeState.selectedWearType;


    return Container(
      padding: EdgeInsets.all(10),
      height: 290,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("의상 정보를 등록해 주세요!"),
            DropdownButton(
              value: selectedWearType,
              items: WearType.values.map((WearType wearType) {
                return DropdownMenuItem(
                  value: wearType,
                  child: Text(wearTypes[wearType.index]),
                );
              }).toList(),
              onChanged: (value) {
                routeState.setWearType(value!);
              },
            ),
            Text("브랜드명"),
            SizedBox(height:10),
            TextField(
              controller: routeState.brandController,
            ),
            SizedBox(height:10),
            Text("옷 이름"),
            SizedBox(height:10),
            TextField(
              controller: routeState.wearController,
            ),
          ],
        ),
      ),
    );
  }
}