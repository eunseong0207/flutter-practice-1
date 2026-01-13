import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_practice_1/matzip.dart';

class MatzipRepository {
  // 파이어스토에서 맛집 가져올거임
  Future<List<Matzip>> getAllMatzip() async {
    print('getAllMatzip 호출됨');
    // 컬렉션 모든 문서들 가지고옴
    final colREf = FirebaseFirestore.instance.collection('matzip');
    // 문서들 List -> Map
    // 맛집 리스트로 변환
    // 맛집 리스트 반환
    return [];
  }
}
