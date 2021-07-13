import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/article_builder.dart';
import 'package:news_app/shared/components/customFormField.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: customFormField(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a search key';
                    } else {
                      return null;
                    }
                  },
                  labelText: "Search",
                  keyBordType: TextInputType.text,
                  controller: _searchController,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                  ),
                  onChange: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(
                child: articleBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
