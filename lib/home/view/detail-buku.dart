import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import 'package:test_msib1/core/theme/theme.dart';
import 'package:test_msib1/core/widget/custom-book.dart';
import 'package:test_msib1/data/model/buku-model.dart';

class DetailBook extends StatelessWidget {
  final Data data;
  const DetailBook({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          color: grey100,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                BookWidget(data: data),
                SizedBox(width: 10),
                Flexible(
                  child: SizedBox(
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('title',
                            style: TextStyle(color: grey, fontSize: 12)),
                        Text(
                          '${data.title}',
                          style: TextStyle(
                              color: black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 4),
                        Text('subtitle',
                            style: TextStyle(color: grey, fontSize: 12)),
                        Text(
                          '${data.subtitle}',
                          style: TextStyle(
                              color: black,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Text('isbn', style: TextStyle(color: grey, fontSize: 12)),
            Text(
              '${data.isbn}',
              style: TextStyle(
                  color: black, fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),
            Text('author', style: TextStyle(color: grey, fontSize: 12)),
            Text(
              '${data.author}',
              style: TextStyle(
                  color: black, fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),
            Text('published', style: TextStyle(color: grey, fontSize: 12)),
            Text(
              '${data.published}',
              style: TextStyle(
                  color: black, fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),
            Text('publisher', style: TextStyle(color: grey, fontSize: 12)),
            Text(
              '${data.publisher}',
              style: TextStyle(
                  color: black, fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),
            Text('page', style: TextStyle(color: grey, fontSize: 12)),
            Text(
              '${data.pages}',
              style: TextStyle(
                  color: black, fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 4),
            Text('description', style: TextStyle(color: grey, fontSize: 12)),
            Text(
              '${data.description}',
              style: TextStyle(
                  color: black, fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => home.lauchUrl(urls: data.website!),
              child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: grey200!,
                            offset: Offset(1, 2),
                            blurRadius: 3)
                      ]),
                  child: Text(
                    'WEBSITE',
                    style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
