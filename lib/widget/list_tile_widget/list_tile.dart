import 'package:flutter/material.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';

class ListTileWidget extends ListTile {
  final String? moviesListName;
  final BuildContext context;
  ListTileWidget(
      {required this.moviesListName, required this.context, super.key})
      : super(
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          leading: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.25,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5, bottom: 8),
            decoration: BoxDecorationWidget(),
            child: Text(
              moviesListName ?? 'Data!',
              style: const TextStyle(
                  color: Colors.pink, fontWeight: FontWeight.bold),
            ),
          ),
          trailing: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.12,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 5, bottom: 8),
            decoration: BoxDecorationWidget(),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink,
              size: 18,
            ),
          ),
        );
}
