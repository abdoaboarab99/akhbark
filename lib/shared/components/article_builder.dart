import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import 'build_article_item.dart';

Widget articleBuilder(list, context, {bool isSearch = false}) {
  return ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItem(list[index], context),
      separatorBuilder: (context, index) => Divider(
        thickness: .5,
        color: Colors.blueGrey,
      ),
      itemCount: NewsCubit.get(context).business.length,
    ),
    fallback: (context) => isSearch
        ? Container()
        : Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.deepOrange,
            ),
          ),
  );
}
