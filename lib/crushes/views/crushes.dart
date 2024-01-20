import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:match_dating/crushes/views_models/crushes_view_model.dart';
import 'package:match_dating/localization/localization_const.dart';

import 'package:match_dating/theme/theme.dart';
import 'package:provider/provider.dart';

class Crushes extends StatefulWidget {
  Crushes({Key? key}) : super(key: key);

  @override
  State<Crushes> createState() => _CrushesState();
}

class _CrushesState extends State<Crushes> {

  @override
  void initState(){

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var crushesViewModel = Provider.of<CrushesViewModel>(context, listen: false);

      print("here is the init");
      crushesViewModel.getMyCrushes();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    CrushesViewModel crushesViewModel = context.watch<CrushesViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          getTranslated(context, 'match.match_title'),
          style: white18Style,
        ),
      ),
      body: GridView.builder(
        itemCount: crushesViewModel.my_crushes.length,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail');
            },
            child: Container(
              height: size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    crushesViewModel.my_crushes[index].avatar.toString(),
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: size.height * 0.08,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.8),
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${crushesViewModel.my_crushes[index].prenom} ${crushesViewModel.my_crushes[index].nom}",
                          style: white14Style,
                        ),
                        height5Space,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FeatherIcons.mapPin),
                            width5Space,
                            Text(crushesViewModel.my_crushes[index].country,
                                style: semibold12gwhiteStyle),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
