import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditUserPageState();
}

class EditUserPageState extends State<EditUserPage> {
  File _pickedImage;
  String _value = '2019-12-12';

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl =
        'https://i2.wp.com/polskaplyta-polskamuzyka.pl/wp-content/uploads/2019/09/SANAH.jpg?resize=960%2C960';

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          ClipPath(
            clipper: ArcClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                MaterialButton(
                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => EditUserPage()),
//                    );
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                Center(
                  child: Stack(
                    children: <Widget>[
                      UserAvatar(
                        radius: _width < _height ? _width / 4 : _height / 4,
                        image: _pickedImage == null
                            ? new NetworkImage(imgUrl)
                            : FileImage(_pickedImage),
                        userName: 'Paulina Jozwik',
                        phoneNumber: '+48 875 392 402',
                      ),
                      Positioned(
                        right: -12.0,
                        child: RawMaterialButton(
                          onPressed: _pickImage,
                          child: new Icon(
                            Icons.edit,
                            color: Theme.of(context).primaryColorDark,
                            size: 25.0,
                          ),
                          shape: new CircleBorder(),
                          elevation: 2.0,
                          fillColor: Colors.white,
                          padding: const EdgeInsets.all(8.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'User name'),
                      ),
                      TextFormField(
                        decoration:
                        InputDecoration(labelText: 'Phone number'),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(labelText: 'Pesel'),
                      ),
                      TextFormField(
                        decoration:
                        InputDecoration(labelText: 'Address'),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.date_range),
                              onPressed: _selectDate
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  'Last menstrual period'
                              ),
                              Text(
                                  _value
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.date_range),
                              onPressed: _selectDate
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  'Expected date of birth'
                              ),
                              Text(
                                  _value
                              )
                            ],
                          )
                        ],
                      ),
                      TextFormField(
                        decoration:
                        InputDecoration(labelText: 'Blood group'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2021));
    if (picked != null) setState(() => _value = DateFormat.yMMMd().format(picked));
  }

  Future _pickImage() async {
    final imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(child: Text("Select the image source")),
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    child: Container(
                      height: 45,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.camera_alt,
                            color: Colors.grey[600],
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => Navigator.pop(context, ImageSource.camera),
                  ),
                  MaterialButton(
                    child: Container(
                      height: 45,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.folder_shared,
                            color: Colors.grey[600],
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () =>
                        Navigator.pop(context, ImageSource.gallery),
                  )
                ],
              ),
            ));

    if (imageSource != null) {
      print('imageSource $imageSource');
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file != null) {
        setState(() => _pickedImage = file);
      }
    }
  }
}

class AddressField extends StatelessWidget {
  final line1;
  final line2;

  AddressField({this.line1, this.line2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Address',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Text(
            line1,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16.0,
            ),
          ),
          Text(
            line2,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class InfoField extends StatelessWidget {
  final String title;
  final String subtitle;

  InfoField({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final double radius;
  final ImageProvider image;
  final String userName;
  final String phoneNumber;

  UserAvatar({this.radius, this.image, this.userName, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: radius,
          backgroundImage: image,
        ),
      ],
    );
  }
}
