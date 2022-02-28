import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('Same Photos'),
          backgroundColor: Colors.indigo[800],
        ),
        body: ImageState(),
      ),
    ),
  );
}

final ButtonStyle flatButton = TextButton.styleFrom(
  primary: Colors.white,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(3.0)),
  ),
);

class ImageState extends StatefulWidget {
  const ImageState({Key? key}) : super(key: key);

  @override
  _ImageStateState createState() => _ImageStateState();
}

class _ImageStateState extends State<ImageState> {
  int leftImageNumber = 1;
  int rightImageNumber = 2;

void changeImage(){
leftImageNumber = Random().nextInt(8) + 1;
rightImageNumber = Random().nextInt(8) + 1;
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber ? 'CONGRATULATIONS' : 'TRY AGAIN',
          style: TextStyle(
            fontSize: 38.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    child: Image.asset('images/image-$leftImageNumber.png'),
                    style: flatButton,
                    onPressed: () {
                      setState(() {
                        changeImage();
                        print('left done');
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    child: Image.asset('images/image-$rightImageNumber.png'),
                    style: flatButton,
                    onPressed: () {
                      setState(() {
                     changeImage();
                      });
                      print('right done');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
