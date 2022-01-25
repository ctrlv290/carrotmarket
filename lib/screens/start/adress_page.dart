import 'package:carrotmarket_clone/constant/common_size.dart';
import 'package:carrotmarket_clone/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: common_padding, right: common_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: '도로명으로 검색',
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                // focusedBorder: UnderlineInputBorder(
                //     borderSide: BorderSide(color: Colors.blue)),
                prefixIconConstraints:
                    BoxConstraints(minHeight: 24, minWidth: 24)),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.compass,
              color: Colors.white,
              size: 20,
            ),
            label: Text(
              '현재 위치 찾기',
              style: Theme.of(context).textTheme.button,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: common_padding),
              itemBuilder: (context, index) {
                logger.d('index: $index');
                return ListTile(
                  title: Text('address $index'),
                  subtitle: Text('subtitle $index'),
                );
              },
              itemCount: 30,
            ),
          )
        ],
      ),
    );
  }
}
