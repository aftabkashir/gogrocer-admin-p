import 'package:flutter/material.dart';
import '../consts/constants.dart';
import '../controllers/MenuController.dart' as custom;
import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';
import '../inner_screens/add_prod.dart';
import '../responsive.dart';
import '../services/global_method.dart';
import '../services/utils.dart';
import '../widgets/buttons.dart';
import '../widgets/grid_products.dart';
import '../widgets/header.dart';
import '../widgets/orders_list.dart';
import '../widgets/orders_widget.dart';
import '../widgets/text_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Header(
              fct: () {
                context.read<custom.MenuController>().controlDashboarkMenu();
              },
              title: 'Dashboard',
            ),
            const SizedBox(
              height: 25,
            ),
            TextWidget(
              text: 'Latest Products',
              color: color,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ButtonsWidget(
                    onPressed: () {},
                    text: 'View All',
                    icon: Icons.store,
                    backgroundColor: Colors.blue,
                    textColor: color,
                    iconColor: color,
                  ),
                  const Spacer(),
                  ButtonsWidget(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UploadProductForm(),
                        ),
                      );
                    },
                    text: 'Add product',
                    icon: Icons.add,
                    backgroundColor: Colors.blue,
                    textColor: color,
                    iconColor: color,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // flex: 5,
                  child: Column(
                    children: [
                      Responsive(
                        mobile: ProductGridWidget(
                          crossAxisCount: size.width < 750 ? 2 : 4,
                          childAspectRatio:
                              size.width < 750 && size.width > 350 ? 1.1 : 0.8,
                        ),
                        desktop: ProductGridWidget(
                          childAspectRatio: size.width < 1600 ? 0.8 : 1.05,
                        ),
                      ),
                      const OrdersList(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
