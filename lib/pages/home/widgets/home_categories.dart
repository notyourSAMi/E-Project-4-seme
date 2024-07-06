
import 'package:e_commerce_app/backend/category_controller.dart';
import 'package:e_commerce_app/common/widgets/shimmer/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../sub_category/sub_categories.dart';

class AppHomeCategories extends StatelessWidget {
  const AppHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(
      () {
        if(categoryController.isLoading.value) return const AppCategoryShimmer();
        if(categoryController.featuredCategories.isEmpty){
          return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
        }
       return SizedBox(
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryController.featuredCategories.length,
              itemBuilder: (_, index) {
                final category = categoryController.featuredCategories[index];
                return AppVerticalImageText(
                  image: category.image,
                  title: category.name,
                  onTap: () => Get.to(() => const SubCategoriesScreen()),
                );
              }),
        );
      },

    );
  }
}
