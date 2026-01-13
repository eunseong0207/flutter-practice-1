import 'package:flutter_practice_1/matzip.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  // 여기에 맛집 리스트

  final List<Matzip> matzipList;
  HomeState({required this.matzipList});
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    print('뷰모델 bulid 호출됨');
    return HomeState(matzipList: []);
  }
}

final HomeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
