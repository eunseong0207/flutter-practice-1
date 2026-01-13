import 'package:flutter_practice_1/matzip.dart';
import 'package:flutter_practice_1/matzip_repository.dart';
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
    getData();
    return HomeState(matzipList: []);
  }
}

void getData() {
  print('getData 호출됨');
  // 여기서 Firestore 데이터 가져와서 Matzip 리스트로 변환한 뒤
  final repo = MatzipRepository();
  final matzipList = repo.getAllMatzip();
  // 상태 업데이트 할거임
}

final HomeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
