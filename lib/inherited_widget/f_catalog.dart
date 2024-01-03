import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/inherited_widget/state_management/inh_cart_widget.dart';
import 'package:flutter/material.dart';

import '../common/d_show_alert_dialog.dart';
import '../common/models/vo_catalog.dart';

class CatalogWidget extends StatelessWidget {
  //컨텍스트를 통해서 공유 상태 데이터에 접근



  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("여기는 CatalogWidget Build함수 실행");
    InheritedCartWidget? inheritedCartWidget = InheritedCartWidget.of(context)!;


    return inheritedCartWidget == null ?
    CustomDialogManager.createAlert(context, '경고', '잘못된접근', () { }) :
    ListView.builder(
        itemCount: catalogListSample.length,
        itemBuilder:(context, index){
          //넘겨 받은 리스트 중에 하나의 오브젝트이다.
          Catalog catalog = catalogListSample[index];
         return CatalogItem(
             catalog: catalog,
             isInCart: inheritedCartWidget.cartList.contains(catalog),
             onPressedCatalog: inheritedCartWidget.onPressedCatalog);
        });
  }
}
