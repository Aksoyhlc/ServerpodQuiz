import 'package:flutter/material.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_field.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with StateTools {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const GlobalAppBar(title: "Profile"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: Image.network(ac.userInfo!.imageUrl!).image,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.5),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white.withOpacity(.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.h,
                      CustomTextInput(
                        name: "name",
                        hintText: "Name",
                        initialData: ac.user.value.name,
                      ),
                      10.h,
                      CustomTextInput(
                        name: "username",
                        hintText: "Username",
                        initialData: ac.userInfo!.userName,
                      ),
                      10.h,
                      CustomButton(
                        onTap: () {},
                        title: "Save",
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
