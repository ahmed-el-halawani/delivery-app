import 'dart:ui';
import 'package:delivery_app/bages/store_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widget/widgets.dart';

class StoresList extends StatelessWidget {
  List<SearchResult> searchResult = [];
  String searchKey;

  StoresList({this.searchResult = const [], this.searchKey = ""});

  @override
  Widget build(BuildContext context) {
    print(searchResult);
    return Scaffold(
      body: Column(
        children: [
          storesListWidget(searchResult),
        ],
      ),
    );
  }

  Widget storesListWidget(List<SearchResult> searchResult) {
    return Expanded(
      child: ListView.builder(
        itemCount: searchResult.length,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
          child: Column(
            children: [
              Stack(
                children: [
                  storeImage(searchResult[i].store),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xff33000000),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  storeNameAndSections(context, searchResult[i].store),
                  Material(
                    color: Color(0xff00000000),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        print("go to store");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoreScreen(
                                store: searchResult[i].store,
                                searchKey: searchKey),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        Text(
                          "100%",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "(50)",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .apply(color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.time_to_leave,
                          color: Colors.black87,
                        ),
                        Text(
                          "1.99",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          "\$",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          " ",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Icon(
                          Icons.access_time,
                          color: Colors.black87,
                        ),
                        Text(
                          "20-30min",
                          style: Theme.of(context).textTheme.subtitle1,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Color(0xffF0EBE6),
              ),
              Column(
                children: List.generate(
                  (searchResult[i].product.length > 3)
                      ? 3
                      : searchResult[i].product.length,
                  (index) => InkWell(
                    onTap: () {},
                    child: productContainer(searchResult[i].product[index]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container storeNameAndSections(BuildContext context, Stores store) {
    return Container(
      width: double.infinity,
      height: 150,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            store.storeName.allCaps(),
            style: Theme.of(context)
                .textTheme
                .headline5
                .apply(fontWeightDelta: 2, color: Colors.white)
                .apply(
              shadows: [Shadow(color: Colors.black87, blurRadius: 5)],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (store.storeCategory.isNotEmpty)
                ? store.storeCategory
                    .map((e) => Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0x55000000),
                              ),
                              child: Text(
                                e.allCaps(),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .apply(
                                        color: Colors.white,
                                        fontWeightDelta: 2),
                              ),
                            ),
                            (store.storeCategory.length > 1)
                                ? SizedBox(
                                    width: 9,
                                  )
                                : Container()
                          ],
                        ))
                    .toList()
                : Container(),
          )
        ],
      ),
    );
  }

  Container storeImage(Stores store) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(store.storeImage),
        ),
      ),
    );
  }

  Widget productContainer(Product productItem) {
    return ListTile(
      title: Text(productItem.productName),
      leading: RoundedImage(image: productItem.productImage),
      trailing: Text("price ${productItem.productPrice} \$"),
    );
  }
}
