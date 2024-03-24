import 'package:api/product/enums/colors.dart';
import 'package:flutter/material.dart';

class MessagesPreviewCard extends StatelessWidget {
  const MessagesPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 9,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ProjectColors.pagecolor.color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const Flexible(
              flex: 1,
              child: Center(
                  child: CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage('assets/images/AI_dummy_profile_picture.png'),
              ))),
          Flexible(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: 400,
                              child: Text(
                                'Fderico Engriuas',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(height: 5),
                          Text(
                              'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,),
                          SizedBox(height: 5)
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            '22.24',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: CircleAvatar(
                              maxRadius: 10,
                              backgroundColor: ProjectColors.orange.color,
                            ),
                          )
                        ],
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
