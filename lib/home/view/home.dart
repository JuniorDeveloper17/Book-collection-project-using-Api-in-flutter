import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import 'package:test_msib1/core/theme/theme.dart';
import 'package:test_msib1/core/widget/custom-futurebuilder.dart';
import 'package:test_msib1/core/widget/custom-loading-widget.dart';
import 'package:test_msib1/home/view/detail-buku.dart';
import '../../core/widget/custom-book.dart';
import '../widget/appbar-home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomFutureBuilder(
      futureProvider: () => home.getAllBook(),
      dataBuilder: (p0, data) {
        home.jumlahBuku(data?.data?.length);
        return Column(
          children: [
            AppBarHome(),
            data?.data?.length == 0
                ? Container(
                    padding: EdgeInsets.only(top: 150),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: LottieBuilder.asset(
                                'assets/images/not data.json')),
                        SizedBox(height: 10),
                        Text(
                          'Belum ada buku di tambahkan',
                          style: TextStyle(color: grey, fontSize: 15),
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        slivers: [
                          SliverGrid.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 2 / 2.5,
                                      crossAxisCount: 2),
                              itemCount: data?.data?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () => Get.bottomSheet(
                                        DetailBook(data: data!.data![index])),
                                    child:
                                        BookWidget(data: data?.data?[index]));
                              })
                        ],
                      ),
                    ),
                  ),
          ],
        );
      },
      errorBuilder: (p0, p1) =>
          Center(child: Text('Maaf ada kesalahan Jaringan')),
      loadingBuilder: (p0) => LoadingWidget(bg: false),
    ));
  }
}
