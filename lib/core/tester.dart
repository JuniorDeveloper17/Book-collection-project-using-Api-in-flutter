import 'package:flutter/material.dart';
import 'package:test_msib1/data/datasource/auth-data.dart';
import 'package:test_msib1/data/datasource/book-data.dart';
import 'package:test_msib1/data/datasource/user-data.dart';
import 'package:test_msib1/data/model/buku-model.dart';

class Tester extends StatelessWidget {
  const Tester({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: Text('get buku'),
              onPressed: () => BookDataSource(
                      token: " 109|IqRGwJYTV0SF71PlpakXGopPmLNszZm6h7Z890I6")
                  .getBook(),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
                child: Text('register'),
                onPressed: () async {
                  final data = await AuthDataSource().register(
                      email: 'coba2@gmail.com',
                      password: 'password',
                      repasword: 'password',
                      username: 'ryan 1');
                  if (data != null) {
                    print(data);
                  } else {
                    print('error');
                  }
                }),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
                child: Text('login'),
                onPressed: () async {
                  final data = await AuthDataSource().login(
                    email: 'coba2@gmail.com',
                    password: 'password',
                  );
                  if (data != null) {
                    print(data);
                  } else {
                    print('error');
                  }
                }),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
                child: Text('get user data'),
                onPressed: () async {
                  final data = await UserDataSource(
                          token: "111|A6DLnaKnMlsc8EQmsQ9OJixmDv97smqWpqBpIJiJ")
                      .getUserData();
                  if (data != null) {
                    print(data);
                  } else {
                    print('error');
                  }
                }),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
                child: Text('insert buku'),
                onPressed: () async {
                  final data = await BookDataSource(
                          token: "179|FjCrelEDrMlWnAmE3Bu1NQVLnxNPPkGzArCSRUR7")
                      .insertBook(
                          data: Data(
                    isbn: "12343568",
                    title: "Impian",
                    subtitle: "Saya bukan Seorang pemimpi",
                    author: "pragos",
                    published: "2017-07-16 00:00:00",
                    publisher: "O'Reilly Media",
                    pages: 1,
                    description:
                        "Impian adalah citra atau harapan yang diinginkan oleh seseorang, seringkali terkait dengan pencapaian atau pengalaman yang dianggap positif atau memuaskan. Impian dapat mencakup berbagai bidang kehidupan, seperti karier, hubungan, pertumbuhan pribadi, atau pencapaian tujuan tertentu.",
                    website:
                        "https://github.com/mjavascript/practical-modern-javascript",
                  ));

                  print(data);
                }),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
