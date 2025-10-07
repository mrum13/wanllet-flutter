import 'package:flutter/material.dart';
import 'package:wanllet/common/app_colors.dart';
import 'package:wanllet/common/image_resources.dart';
import 'package:wanllet/widgets/item_transactions.dart';
import 'package:wanllet/widgets/main_feature.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = [
      {
        'image_path': bca,
        'title': "Freelance Aplikasi",
        'date': "Wed, 01 Oct 2025",
        'value': "3.000.000",
        'is_spend': false,
      },
      {
        'image_path': qris,
        'title': "Kopi Susu",
        'date': "Sun, 05 Oct 2025",
        'value': "12.000",
        'is_spend': true,
      },
      {
        'image_path': qris,
        'title': "Nasi Goreng",
        'date': "Sun, 05 Oct 2025",
        'value': "15.000",
        'is_spend': true,
      },
    ];
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(avatar, height: 42, width: 42),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Rum",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "+6285397xxxxxx",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: white9percent,
                      shape: BoxShape.circle,
                    ),
                    child: Badge(
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              "Your Balanced",
              style: TextStyle(
                color: whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Rp.123.456",
              style: TextStyle(
                color: whiteColor,
                fontSize: 46,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add, size: 32, color: whiteColor),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Top Up",
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/search");
                  },
                  child: MainFeature(imagePath: send, title: "Send")),
                MainFeature(imagePath: request, title: "Request"),
                MainFeature(imagePath: scan, title: "Scan"),
              ],
            ),
            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: white9percent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transactions",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: whiteColor,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ItemTransactions(
                        imagePath: data[index]['image_path'].toString(),
                        title: data[index]['title'].toString(),
                        date: data[index]['date'].toString(),
                        value: data[index]['value'].toString(),
                        isSpend: bool.parse(data[index]['is_spend'].toString()),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: data.length,
                  ),
                  // const SizedBox(height: 20,),
                  Image.asset(banner, width: double.infinity, height: 147, fit: BoxFit.cover,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
