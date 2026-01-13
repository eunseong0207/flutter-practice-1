class Matzip {
  /// 상호명
  final String name;

  /// 주소
  final String address;

  /// 평점
  final String rate;
  // 기본 생성자
  Matzip({required this.name, required this.address, required this.rate});

  /// 1. JSON으로부터 객체를 생성하는 Factory 생성자
  factory Matzip.fromJson(Map<String, dynamic> json) {
    return Matzip(name: json['상호명'], address: json['주소'], rate: json['평점']);
  }

  /// 2. 객체를 JSON(Map) 형태로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {'상호명': name, '주소': address, '평점': rate};
  }
}
