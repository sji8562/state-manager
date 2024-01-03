import 'package:class_statement/common/d_show_alert_dialog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/inherited_widget/state_management/inh_cart_widget.dart';
import 'package:flutter/material.dart';

import '../common/models/vo_catalog.dart';

//inheitedWidge
//생성자 의존 주입 하지 않아도된다
class CartWidget extends StatelessWidget {
  // 선택된 카탈로그 정보를 받고, 콜백 함수까지 전달 받아야 함.

  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("여기는 CartWidget Build함수 실행");
    InheritedCartWidget? inheritedCartWidget = InheritedCartWidget.of(context);
    //방어적 코드 처리
    return inheritedCartWidget == null ?
     CustomDialogManager.createAlert(context, '경고', '잘못된접근', () { })
        : Column(
      children: [
        // 카탈로그 아이템
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: inheritedCartWidget.cartList.length,
            itemBuilder: (context, index) {
              // 하나에 오브젝트만 뽑자.
              Catalog catalog = inheritedCartWidget.cartList[index];
              return CatalogItem(
                  catalog: catalog,
                  isInCart: true,
                  onPressedCatalog: inheritedCartWidget.onPressedCatalog);
            },
          ),
        ),
        // 구분선
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.green,
        ),
        // 합계 - 텍스트
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'SUM : ${inheritedCartWidget.cartList.length}',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}