import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanllet/common/app_colors.dart';
import 'package:wanllet/common/image_resources.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var historyData = [
      {
        'image_path': avatar3,
        'name': 'Ihsan Mustapa',
        'number': '+6285397875412'
      },
      {
        'image_path': avatar1,
        'name': 'Rihan Nugraha',
        'number': '+6285397875456'
      },
    ];

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              background2,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Image.asset(
              searchBackground,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: const EdgeInsets.only(left: 16, top: 16),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.arrow_back_ios_new, size: 24, color: whiteColor,),
                        ),
                      ),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    margin: const EdgeInsets.only(bottom: 16),
                    width: double.infinity,
                    height: 116,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            const SizedBox(width: 16,),
                            Container(
                              width: 300,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(cardBackground),
                                  fit: BoxFit.cover
                                ) 
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    historyData[index]['image_path'].toString(), 
                                    height: 50, 
                                    width: 50,
                                  ),
                                  const SizedBox(width: 12,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          historyData[index]['name'].toString(), 
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: whiteColor),
                                        ),
                                        Text(
                                          historyData[index]['number'].toString(), 
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Icon(Icons.arrow_forward_outlined, size: 24, color: whiteColor,),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      }, 
                      itemCount: historyData.length
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
