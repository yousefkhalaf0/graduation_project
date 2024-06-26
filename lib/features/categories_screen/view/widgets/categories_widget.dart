import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/router/routes.dart';
import '../../../home_screen/model/home_model.dart';
import '../../model/categories_model.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, this.categoriesModel});
  final CategoriesModel? categoriesModel;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 87.w,
            height: 87.h,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('${categoriesModel!.image}'),
            ),
          ),
          Text(
            '${categoriesModel!.title}',
            style: TextStyle(fontSize: 12.sp, fontFamily: 'Lato-Regular.ttf'),
          )
        ],
      ),
    );
  }
}

class RotatedTabBarWidget extends StatelessWidget {
  final TabController tabController;
  const RotatedTabBarWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 102.w,
          height: 336.h,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5.w, color: Colors.black12)),
          child: RotatedBox(
            quarterTurns: 1,
            child: TabBar(
              controller: tabController,
              indicatorWeight: 5,
              labelPadding: EdgeInsets.only(top: 1.h),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xff1C6E97),
              labelStyle: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'Lato-Regular.ttf',
              ),
              tabs: HomeCategoriesModel.data.map((category) {
                return RotatedTabWidget(title: category.title!);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class RotatedTabWidget extends StatelessWidget {
  final String title;

  const RotatedTabWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Tab(text: title),
    );
  }
}

Widget generateGridViewWidget(List<CategoriesModel> items) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    itemCount: items.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 24.h,
    ),
    itemBuilder: (context, index) => GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productsViewScreenRoute,
            arguments: items[index]);
      },
      child: CategoriesWidget(
        categoriesModel: items[index],
      ),
    ),
  );
}
