import 'package:flutter/material.dart';

import '../../const.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectCategory = 0;
  List<String> categories = ["Box Office", "Coming", "Dram", "Comedi",];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildCategoryName(index, context);
          }),
    );
  }

  Widget _buildCategoryName(int index, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: (){
          setState(() {
            selectCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.w500,
                  color: index == selectCategory
                      ? Colors.black87
                      : Colors.black.withOpacity(0.5)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              width: 40,
              height: 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == selectCategory
                      ? Colors.redAccent
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}