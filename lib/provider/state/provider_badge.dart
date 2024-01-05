import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';

class ProviderBadge extends ChangeNotifier {
  ProviderBadge({required this.providerCart}) {
    //생성자 몸체
    providerCart.addListener(providerCartListner); //청취
  }

  //상태 속성
  int counter = 0;

  //청취
  final ProviderCart providerCart;

  //상태 변경 로직 구현
  //청취하고 있다가 ProviderCart 변경 되면 어떤 동작을 할지 결정
  void providerCartListner() {
    counter = providerCart.catalogCartList.length;
    //알림 처리
    notifyListeners();
  }

  //메모리 해제 처리
  @override
  void dispose() {
    //메모리에서 제거 처리
    providerCart.removeListener(providerCartListner);
    //부모 클래스에 함수호출
    super.dispose();
  }
}
