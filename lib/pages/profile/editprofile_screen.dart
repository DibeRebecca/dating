import 'package:flutter/material.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = "Ravi patel";
    emailController.text = " example@gmail.com";
    birthController.text = "23 june 2001";
    heightController.text = "180";
    weightController.text = "60";
    interestController.text = "Reading,Writing";
    occupationController.text = "Ux Designer";
    nationalityController.text = "Indian";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 22,
              color: whiteColor,
            ),
          ),
        ),
        titleSpacing: 0,
        title: Text(
          getTranslated(context, 'edit_profile.edit_profile'),
          style: white18Style,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2),
        children: [
          profileContainer(size),
          Text(
            getTranslated(context, 'edit_profile.add_photo'),
            style: semibold16blackStylew500,
          ),
          height5Space,
          userphotos(size),
          heightSpace,
          nameField(context),
          emailField(context),
          birthdateField(context),
          heightField(context),
          weight(context),
          interestField(context),
          occupationField(context),
          nationalityField(context),
        ],
      ),
      bottomNavigationBar: updateButton(),
    );
  }

  nationalityField(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        keyboardType: TextInputType.text,
        controller: nationalityController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: getTranslated(context, 'edit_profile.Nationality'),
            hintStyle: medium14GreyStyle),
      ),
    );
  }

  occupationField(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        keyboardType: TextInputType.text,
        controller: occupationController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: getTranslated(context, 'edit_profile.Occupation'),
            hintStyle: medium14GreyStyle),
      ),
    );
  }

  interestField(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        keyboardType: TextInputType.text,
        controller: interestController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: getTranslated(context, 'edit_profile.Interest'),
            hintStyle: medium14GreyStyle),
      ),
    );
  }

  weight(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        keyboardType: TextInputType.number,
        controller: weightController,
        decoration: InputDecoration(
            suffix: Text(
              getTranslated(context, 'edit_profile.kg'),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            border: InputBorder.none,
            hintText: getTranslated(context, 'edit_profile.Weight'),
            hintStyle: medium14GreyStyle),
      ),
    );
  }

  heightField(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        keyboardType: TextInputType.number,
        controller: heightController,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffix: Text(
              getTranslated(context, 'edit_profile.cm'),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            hintText: getTranslated(context, 'edit_profile.height'),
            hintStyle: medium14GreyStyle),
      ),
    );
  }

  birthdateField(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        keyboardType: TextInputType.name,
        controller: birthController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: getTranslated(context, 'edit_profile.date_birth'),
            hintStyle: medium14GreyStyle),
      ),
    );
  }

  emailField(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: getTranslated(context, 'edit_profile.email_address'),
            hintStyle: medium14GreyStyle),
      ),
    );
  }

  nameField(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: fixPadding),
      padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.5),
            blurRadius: 5,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        keyboardType: TextInputType.name,
        controller: nameController,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: getTranslated(context, 'edit_profile.name'),
            hintStyle: medium14GreyStyle),
      ),
    );
  }

  updateButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffF6BDC0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor.withOpacity(0.7),
              gridentColor.withOpacity(0.75),
            ],
          ),
        ),
        child: Text(
          getTranslated(context, 'edit_profile.UPDATE'),
          style: extraboldTextStyle.copyWith(
            fontSize: 21,
          ),
        ),
      ),
    );
  }

  userphotos(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: size.height * 0.12,
          width: size.width * 0.27,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage("assets/profile/e1.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          height: size.height * 0.12,
          width: size.width * 0.27,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage("assets/profile/e2.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          height: size.height * 0.12,
          width: size.width * 0.27,
          decoration: BoxDecoration(
            color: const Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.add,
                  size: 18,
                  color: whiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  profileContainer(Size size) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: size.height * 0.13,
            width: size.height * 0.14,
            child: Stack(
              children: [
                Container(
                    height: size.height * 0.13,
                    width: size.height * 0.13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/itsmatch/m2jpg.jpg",
                          fit: BoxFit.cover,
                        ))),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        barrierColor: blackColor.withOpacity(0.2),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10))),
                        elevation: 4,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: size.height * 0.28,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: fixPadding * 2,
                                horizontal: fixPadding * 3),
                            decoration: const BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  getTranslated(context,
                                      'edit_profile.change_profile_photo'),
                                  style: semibold18blackStyle,
                                ),
                                heightSizeBox(25),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    bottonsheetIcon(
                                        size,
                                        Icons.camera_alt_rounded,
                                        const Color(0xff1E4799),
                                        getTranslated(
                                            context, 'edit_profile.camera')),
                                    bottonsheetIcon(
                                        size,
                                        Icons.photo,
                                        const Color(0xff1E996D),
                                        getTranslated(
                                            context, 'edit_profile.gallery')),
                                    bottonsheetIcon(
                                        size,
                                        Icons.delete_outline_outlined,
                                        const Color(0xffEF1717),
                                        getTranslated(context,
                                            'edit_profile.remove_image')),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: size.height * .045,
                      width: size.height * .045,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt_sharp,
                        color: whiteColor,
                        size: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        heightSpace,
        Text(getTranslated(context, 'edit_profile.profile_name'),
            textAlign: TextAlign.center, style: black18Style),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/detail/akar-icons_location.png",
              height: 20,
              width: 20,
            ),
            width5Space,
            Text(getTranslated(context, 'edit_profile.profile_location'),
                style: semibold14greyStyle)
          ],
        ),
      ],
    );
  }

  bottonsheetIcon(Size size, IconData icon, Color color, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: SizedBox(
        width: size.width * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.3),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: color,
              ),
            ),
            height5Space,
            Text(text.toString(),
                style: medium16blackStyle, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
