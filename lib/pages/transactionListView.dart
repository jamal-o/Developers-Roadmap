import 'package:flutter/material.dart';

import '../services/database/lineItem.dart';
import 'constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(createOrUpdateLineItemView);
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: _lineItemsList(context),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      title: const Text('Legeere'),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(8),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2,
            ),
            child: Row(
              children: const <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    'Description',
                    maxLines: 1,
                  ),
                ),
                VerticalDivider(
                  width: 10,
                ),
                Text('Account'),
                VerticalDivider(
                  width: 10,
                ),
                Text('Amount'),
                VerticalDivider(
                  width: 10,
                ),
                Text('Date'),
              ],
            ),
          )),
    );
  }

  Widget _lineItemsList(BuildContext context) {
    List<LineItem> lineItems = [];

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(children: <Widget>[
              Text(
                lineItems[index].description,
                maxLines: 1,
              ),
              const VerticalDivider(
                width: 10,
              ),
              Text(lineItems[index].accountName),
              const VerticalDivider(
                width: 10,
              ),
              Text(lineItems[index].amount.toString()),
              const VerticalDivider(
                width: 10,
              ),
              Text(lineItems[index].transactionDate.toString()),
            ]),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('detailView');
          },
        );
      },
    );
  }
}
