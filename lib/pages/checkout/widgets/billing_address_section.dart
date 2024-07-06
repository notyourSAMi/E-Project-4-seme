import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';

class AppBillingAddressSection extends StatelessWidget {
  const AppBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', showActionButton: true, onPressed: () {},),
        Text('Coding with T' , style: Theme.of(context).textTheme.bodyLarge,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16,),
            const SizedBox(width: AppSizes.spaceBtwItems,),
            Text('+92-317-8059525' , style: Theme.of(context).textTheme.bodyMedium,),

          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems/ 2,),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const SizedBox(width: AppSizes.spaceBtwItems,),
            Text('South Liana, Maine 87695, USA' , style: Theme.of(context).textTheme.bodyMedium,),          ],
        )
      ],
    );
  }
}
