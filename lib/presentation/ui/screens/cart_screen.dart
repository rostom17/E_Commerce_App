import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/widgets/bottom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) => Card(
            elevation: 3,
            child: SizedBox(
              height: 120,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: double.maxFinite,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/thisShoe.jpg',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dummy Data".substring(0, 10),
                            //substring(0, 10)
                            // length jodi kom hoi but ami besi dei tobe error dibe
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            "Color: dummy Color, Size: XL",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          //const Spacer(),
                          const Text(
                            "\$100",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColorTheme.appColorTheme,
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.delete)),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor:
                                    AppColorTheme.appColorTheme.withOpacity(.4),
                                maxRadius: 12,
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text("2"),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                backgroundColor: AppColorTheme.appColorTheme,
                                maxRadius: 12,
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBarWidget(buttonName: "Checkout", price: "120", priceTag: "Total Price",),
    );
  }
}
