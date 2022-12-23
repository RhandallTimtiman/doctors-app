import 'package:consumer_app/app/core/utilities/size.dart';
import 'package:consumer_app/app/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ErxScreen extends StatefulWidget {
  const ErxScreen({Key? key}) : super(key: key);

  @override
  State<ErxScreen> createState() => _ErxScreenState();
}

class _ErxScreenState extends State<ErxScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const ErxAppBar(
        title: 'eRX Dashboard',
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(
          Screen.getProportionateScreenHeight(
            context,
            16,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: ErxScoreCard(
                      title: 'Total eRX',
                      count: 100,
                      icon: FontAwesomeIcons.notesMedical,
                    ),
                  ),
                  SizedBox(
                    width: Screen.getProportionateScreenHeight(
                      context,
                      4,
                    ),
                  ),
                  const Expanded(
                    child: ErxScoreCard(
                      title: 'Total Patient',
                      count: 100,
                      icon: Icons.favorite,
                    ),
                  ),
                  SizedBox(
                    width: Screen.getProportionateScreenHeight(
                      context,
                      4,
                    ),
                  ),
                  const Expanded(
                    child: ErxScoreCard(
                      title: 'Total Meds',
                      count: 100,
                      icon: Icons.medication,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  12,
                ),
              ),
              const ErxTopCard(
                title: 'Top Medicine',
                icon: FontAwesomeIcons.tablet,
                content: ErxTopMedicineContent(),
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  12,
                ),
              ),
              const ErxTopCard(
                title: 'Top Patient',
                icon: FontAwesomeIcons.peopleGroup,
                content: ErxTopPatientContent(),
              ),
              SizedBox(
                height: Screen.getProportionateScreenHeight(
                  context,
                  12,
                ),
              ),
              SizedBox(
                width: Screen.getProportionateScreenWidth(
                  context,
                  Screen.width(context) * 0.8,
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  color: Theme.of(context).primaryColor,
                  minWidth: double.infinity,
                  onPressed: () {
                    Get.toNamed(
                      '/create-eprescription',
                    );
                  },
                  child: Text(
                    'Create ePrescription',
                    style: textTheme.headline6!.copyWith(
                      fontSize: Screen.getProportionateScreenHeight(
                        context,
                        16,
                      ),
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
