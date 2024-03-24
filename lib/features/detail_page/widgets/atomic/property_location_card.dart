
import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class PropertyLocationCard extends StatelessWidget {
  const PropertyLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 2 / 5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ProjectColors.pagecolor.color,
                borderRadius: BorderRadius.circular(25))),
        SizedBox(
           height: MediaQuery.of(context).size.height * 2 / 25,
            width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              backgroundColor: ProjectColors.pagecolor.color,
            ),
            child:  Text('View all on map', style: Theme.of(context).textTheme.headlineSmall,),
          ),
        ),
      ],
    );
  }
}
