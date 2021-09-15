import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:editable_profile/model/user.dart';
import 'package:editable_profile/page/edit_bio_page.dart';
import 'package:editable_profile/page/edit_email_page.dart';
import 'package:editable_profile/page/edit_name_page.dart';
import 'package:editable_profile/page/edit_phone_page.dart';
import 'package:editable_profile/page/edit_photo_page.dart';
import 'package:editable_profile/utils/user_preferences.dart';
import 'package:editable_profile/widget/appbar_widget.dart';
import 'package:editable_profile/widget/button_widget.dart';
import 'package:editable_profile/widget/numbers_widget.dart';
import 'package:editable_profile/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              buildEditProfile(user),
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditPhotoPage()),
                  );
                },
              ),
              buildEditName(user),
              buildEditPhone(user),
              buildEditEmail(user),
              buildEditAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditProfile(User user) => Container(
        alignment: Alignment.center,
        child: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      );

  Widget buildEditName(User user) => Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
          ),
          label: Text(user.name),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditNamePage()),
            );
            setState(() {});
          },
          style: ButtonStyle(
            alignment: Alignment.bottomLeft,
          ),
        ),
      );

  Widget buildEditPhone(User user) => Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          icon: Icon(Icons.arrow_back_ios_rounded),
          label: Text(user.phone),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditPhonePage()),
            );
            setState(() {});
          },
          style: ButtonStyle(
            alignment: Alignment.bottomLeft,
          ),
        ),
      );

  Widget buildEditEmail(User user) => Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          icon: Icon(Icons.arrow_back_ios_rounded),
          label: Text(user.email),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditEmailPage()),
            );
            setState(() {});
          },
          style: ButtonStyle(
            alignment: Alignment.bottomLeft,
          ),
        ),
      );

  Widget buildEditAbout(User user) => Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          icon: Icon(Icons.arrow_back_ios_rounded),
          label: Text(user.about),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditBioPage()),
            );
            setState(() {});
          },
          style: ButtonStyle(
            alignment: Alignment.bottomLeft,
          ),
        ),
      );

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
