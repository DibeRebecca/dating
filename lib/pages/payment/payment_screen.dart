import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:match_dating/localization/localization_const.dart';
import 'package:match_dating/theme/theme.dart';
import 'package:month_year_picker/month_year_picker.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController holderController = TextEditingController();

  final TextEditingController cardNumController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: whiteColor,
          ),
        ),
        titleSpacing: 0,
        title: Text(
          getTranslated(context, 'payment.payment_title'),
          style: white18Style,
        ),
      ),
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(fixPadding * 2),
              child: Column(
                children: [
                  cardHolderField(context),
                  heightSpace,
                  cardNumField(context),
                  heightSpace,
                  Row(
                    children: [
                      Expanded(
                        child: cvvField(context),
                      ),
                      widthSizeBox(15),
                      Expanded(
                        child: validDateField(context),
                      )
                    ],
                  ),
                  heightSizeBox(size.height * 0.12),
                  payButton(context, size),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  payButton(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/success');
      },
      child: Container(
        height: size.height * 0.09,
        width: size.width * 0.67,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffF6BDC0),
          borderRadius: BorderRadius.circular(25),
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
          getTranslated(context, 'payment.pay_securlay'),
          style: extraboldTextStyle.copyWith(
            fontSize: 21,
          ),
        ),
      ),
    );
  }

  validDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, 'payment.valid_through'),
          style: medium16whiteStyle.copyWith(color: greyColorb7),
        ),
        height5Space,
        Container(
          height: 50,
          padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.3),
                blurRadius: 5,
              )
            ],
          ),
          child: TextField(
            controller: dateController,
            cursorColor: primaryColor,
            style: medium162blackStyle.copyWith(
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: getTranslated(context, 'payment.Valid_date'),
              hintStyle:
                  medium14GreyStyle.copyWith(decoration: TextDecoration.none),
            ),
            readOnly: true,
            onTap: () async {
              var pickedDate = await showMonthYearPicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                String formattedDate = DateFormat('MM/yy').format(pickedDate);

                setState(() {
                  dateController.text = formattedDate;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  cvvField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, 'payment.cvv'),
          style: medium16whiteStyle.copyWith(color: greyColorb7),
        ),
        height5Space,
        Container(
          height: 50,
          padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.3),
                blurRadius: 5,
              )
            ],
          ),
          child: TextField(
            controller: cvvController,
            cursorColor: primaryColor,
            keyboardType: TextInputType.number,
            style: medium162blackStyle.copyWith(
              decoration: TextDecoration.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(3),
            ],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: getTranslated(context, 'payment.cvv_num'),
              hintStyle:
                  medium14GreyStyle.copyWith(decoration: TextDecoration.none),
            ),
          ),
        ),
      ],
    );
  }

  cardNumField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, 'payment.card_number'),
          style: medium16whiteStyle.copyWith(color: greyColorb7),
        ),
        height5Space,
        Container(
          height: 50,
          padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.3),
                blurRadius: 5,
              )
            ],
          ),
          child: TextField(
            cursorColor: primaryColor,
            controller: cardNumController,
            keyboardType: TextInputType.number,
            style: medium162blackStyle.copyWith(
              decoration: TextDecoration.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(16),
            ],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: getTranslated(context, 'payment.number'),
              hintStyle:
                  medium14GreyStyle.copyWith(decoration: TextDecoration.none),
            ),
          ),
        ),
      ],
    );
  }

  cardHolderField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, 'payment.card_holdar_name'),
          style: medium16whiteStyle.copyWith(color: greyColorb7),
        ),
        height5Space,
        Container(
          height: 50,
          padding: const EdgeInsets.only(left: fixPadding, right: fixPadding),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.3),
                blurRadius: 5,
              )
            ],
          ),
          child: TextField(
            cursorColor: primaryColor,
            controller: holderController,
            style: medium162blackStyle.copyWith(
              decoration: TextDecoration.none,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: getTranslated(context, 'payment.name'),
              hintStyle:
                  medium14GreyStyle.copyWith(decoration: TextDecoration.none),
            ),
          ),
        ),
      ],
    );
  }
}
