import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import 'package:test_msib1/core/theme/theme.dart';
import 'package:test_msib1/core/widget/custom-futurebuilder.dart';
import 'package:test_msib1/data/model/buku-model.dart';
import 'package:test_msib1/management/widget/custom-widget-itembook.dart';
import 'package:test_msib1/management/view/add-book.dart';
import 'package:test_msib1/management/view/edit-book.dart';
import '../../core/widget/custom-loading-widget.dart';

class ManagementView extends StatelessWidget {
  const ManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AvatarGlow(
          glowColor: blue,
          glowCount: 1,
          glowRadiusFactor: 0.9,
          child: ClipOval(
            child: FloatingActionButton(
                backgroundColor: white,
                child: Icon(Icons.add, size: 30, color: blue),
                onPressed: () {
                  management.clearText();
                  Get.to(() => AddBook(), transition: Transition.downToUp);
                }),
          ),
        ),
        body: CustomFutureBuilder(
          futureProvider: () => management.getAllBook(),
          dataBuilder: (p0, data) {
            return Obx(
              () => management.bukuData.value.data?.length == 0
                  ? Center(
                      child: LottieBuilder.asset('assets/images/not data.json'))
                  : ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                      physics: BouncingScrollPhysics(),
                      itemCount: management.bukuData.value.data?.length,
                      itemBuilder: (context, index) {
                        Data? data = management.bukuData.value.data![index];
                        return InkWell(
                          onTap: () => Get.to(() => EditBook(),
                              arguments: int.parse("${data.id}")),
                          child: WidgetItemBook(
                            data: management.bukuData.value,
                            index: index,
                          ),
                        );
                      }),
            );
          },
          errorBuilder: (p0, p1) =>
              Center(child: Text('Maaf ada kesalahan Jaringan')),
          loadingBuilder: (p0) => LoadingWidget(bg: false),
        ));
  }
}
