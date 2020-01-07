import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pregnancy_card/user_profile/user_profile_edit_page.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage> {
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
              height: 335,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditUserPage()),
                    );
                  },
                  child: Text(
                    'Edit',
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
                  child: UserAvatar(
                    radius: _width < _height ? _width / 4 : _height / 4,
                    imgUrl: imgUrl,
                    userName: 'Paulina Jozwik',
                    phoneNumber: '+48 875 392 402',
                  ),
                ),
                SizedBox(height: 20.0,),
                InfoField(title: 'Pesel', subtitle: '94102400000'),
                SizedBox(height: 5.0,),
                AddressField(line1: 'Wrzosowo', line2: '78-114'),
                SizedBox(height: 5.0,),
                InfoField(title: 'Last menstrual period', subtitle: '2019-December-12'),
                SizedBox(height: 5.0,),
                InfoField(title: 'Expected date of birth', subtitle: '2020-August-12'),
                SizedBox(height: 5.0,),
                InfoField(title: 'Mother blood group', subtitle: '0RH+'),
              ],
            ),
          ),
        ],
      ),
    );
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
  final String imgUrl;
  final String userName;
  final String phoneNumber;

  UserAvatar({this.radius, this.imgUrl, this.userName, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: radius,
          backgroundImage: new NetworkImage(imgUrl),
        ),
        Text(
          userName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
          ),
        ),
        Text(
          phoneNumber,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
