import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:twitter/twitter/login.dart';
import 'package:twitter/class/profiles.dart';

class TwitterAppBar extends StatelessWidget {
  final String currDisplayName;
  final ProfileData profileData;

  TwitterAppBar({required this.currDisplayName, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      elevation: 0,
              centerTitle: true,
        title: Image.asset(
          'assets/images/twitterXlogo.avif',
          height: 30,
          width: 30,
        ),
      leading: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Log Out'),
                content: Text('Are you sure you want to log out?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(profileData: profileData),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: ProfilePicture(
          name: currDisplayName,
          radius: 12,
          fontsize: 10,
          random: true,
          count: 2,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings_outlined,
            color: Colors.white,
          ),
        ),
      ],
      floating: true,
      snap: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'for you ',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 2.0,
                ),
              ),
              Text(
                'following',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
