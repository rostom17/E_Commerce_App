import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    required this.buttonName,
    required this.price,
    required this.priceTag,
    super.key,
  });

  final String buttonName;
  final String price;
  final String priceTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: AppColorTheme.appColorTheme.withOpacity(.3),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(priceTag,style: Theme.of(context).textTheme.titleSmall,),
                Text("\$${price}",style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const  Size.fromWidth(120),
              ),
              onPressed: (){}, child: Text(buttonName, style: const TextStyle(color: Colors.white),),),
          ],
        ),
      ),
    );
  }
}