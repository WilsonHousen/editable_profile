import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:editable_profile/model/user.dart';
import 'package:editable_profile/utils/user_preferences.dart';
import 'package:editable_profile/widget/appbar_widget.dart';
import 'package:editable_profile/widget/button_widget.dart';
import 'package:editable_profile/widget/profile_widget.dart';
import 'package:editable_profile/widget/textfield_widget.dart';

class EditEmailPage extends StatefulWidget {
  @override
  _EditEmailPageState createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: buildAppBar(context),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: "What's your Email?",
                  text: user.email,
                  onChanged: (email) {},
                ),
                ElevatedButton(
                    child: Text("Update"),
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black))),
              ],
            ),
          ),
        ),
      );
}
