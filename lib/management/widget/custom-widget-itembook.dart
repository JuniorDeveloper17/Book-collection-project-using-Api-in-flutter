import 'package:flutter/material.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import '../../data/model/buku-model.dart';
import '../../core/theme/theme.dart';
import '../../core/widget/custom-book.dart';

class WidgetItemBook extends StatelessWidget {
  final int index;
  final BukuModel data;
  const WidgetItemBook({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(flex: 2, child: BookWidget(data: data.data![index])),
            SizedBox(width: 10),
            Flexible(
              flex: 2,
              child: Container(
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'subtitle',
                      style: TextStyle(
                          fontSize: 12,
                          color: black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${data.data?[index].subtitle}',
                      style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'publiser',
                      style: TextStyle(
                          fontSize: 12,
                          color: black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${data.data?[index].publisher}',
                      style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'author',
                      style: TextStyle(
                          fontSize: 12,
                          color: black,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${data.data?[index].author}',
                      style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: InkWell(
                            onTap: () =>
                                home.lauchUrl(urls: data.data![index].website!),
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey200!,
                                        offset: Offset(1, 2),
                                        blurRadius: 3)
                                  ]),
                              child: Text(
                                'Website',
                                style: TextStyle(
                                    color: blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: () => management.deleteBook(
                                id: int.parse("${data.data?[index].id}"),
                                item: data.data![index]),
                            child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: grey200!,
                                          offset: Offset(1, 2),
                                          blurRadius: 3)
                                    ]),
                                child: Icon(Icons.delete, color: red)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Divider(
          color: grey200,
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
