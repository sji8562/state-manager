import 'package:class_statement/common/w_catalog_item.dart';
import 'package:flutter/material.dart';

import '../common/models/vo_catalog.dart';

class CatalogWidget extends StatelessWidget {
  //통신을 통해 받은 데이터 필요함
  final List<Catalog> responseListData;
  final List<Catalog> cartCatalogList;
  final void Function(Catalog catalog) onPressedCatalog;


  const CatalogWidget({super.key, required this.responseListData, required this.cartCatalogList, required this.onPressedCatalog});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: responseListData.length,
        itemBuilder:(context, index){
          //넘겨 받은 리스트 중에 하나의 오브젝트이다.
          Catalog catalog = responseListData[index];
         return CatalogItem(
             catalog: catalog,
             isInCart: cartCatalogList.contains(catalog),
             onPressedCatalog: onPressedCatalog);
        });
  }
}
