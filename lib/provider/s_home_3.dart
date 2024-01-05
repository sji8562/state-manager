import 'package:class_statement/provider/state/provider_badge.dart';
import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/models/vo_catalog.dart';
import '../common/w_bottom_bar.dart';
import 'f_cart.dart';
import 'f_catalog.dart';

// 상태 관리 - 프로바이더 활용
class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  // 현재 선택된 index
  int currentIndex = 0;

  // 선택된 카탈로그 정보를 담을 수 있는 자료 구조 선언
  List<Catalog> catalogList = [];

  // 샘플 데이터 (local DB, 통신)
  late List<Catalog> responseListData;

  // 메모리에 올라갈 때 딱 한번만 초기화 되는 부분
  @override
  void initState() {
    super.initState();
    // initState <-- 위젯을 업데이트 하는 코드를 사용하면 안된다. (버그발생)
    // 가능한 데이터 초기화 처리만 사용하자.
    responseListData = catalogListSample;
  }

  @override
  Widget build(BuildContext context) {
    //context.watch()
    print("HomeScreen build() 함수 호출");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderCart()),
        ChangeNotifierProvider(create: (context) => ProviderBadge(providerCart: context.read<ProviderCart>())),
        // ChangeNotifierProvider(create: (context) => ProviderCart()),
        // ChangeNotifierProvider(create: (context) => ProviderCart()),
        // 단점 - 동일한 상태를 등록하면 마지막에 선언된 상태 제공자에게만 접근 가능 함
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Catalog'),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: [
            CatalogWidget(),
            CartWidget(),
          ],
        ),
        bottomNavigationBar: Consumer<ProviderBadge>(
          builder: (context, ProviderBadge, child) => BottomBar(
            currentIndex: currentIndex,
            cartTotal: '${ProviderBadge.counter}',
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
