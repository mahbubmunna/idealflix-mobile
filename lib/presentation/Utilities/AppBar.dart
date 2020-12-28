/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ExportUtilities.dart';

AppBar AppBarWidget(BuildContext context, {String title}) {
  return AppBar(
      title: Text(title),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              SvgPicture.asset(
                "assets/images/wish-list.svg",
                height: 25,
                width: 25,
                color: AppColors.secondaryColor,
              ),
              Positioned(
                top: -10,
                right: -5,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    "0",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: AppColors.backgroundColor, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              SvgPicture.asset(
                "assets/images/cart-icon.svg",
                height: 25,
                width: 25,
                color: AppColors.secondaryColor,
              ),
              Positioned(
                top: -10,
                right: -5,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    "0",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: AppColors.backgroundColor, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
      leading: Builder(
        builder: (context) => InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset(
            "assets/images/menu-icon.png",
            height: 14,
            width: 20,
            color: AppColors.primaryColor,
          ),
        ),
      )
  );
}
*/
