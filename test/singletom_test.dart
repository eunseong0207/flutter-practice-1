// void main() {
//   //
//   MyClass m1 = MyClass();
//   MyClass m2 = MyClass();
// }

// // 클래스 구성요소
// // 속성, 메서드, 생성자
// class MyClass {
//   // 생성자를 지정하지 않으면 기본 생성자를 만들어줌
//   // MyClass();
//   int count = 1;
// }
void main() {
  //
  final m1 = MySingletonClass();
  final m2 = MySingletonClass();
  final m3 = MySingletonClass();
}

// 싱글톤 패턴
// 객체를 하나만 생성해서 앱 전체에 공유하여 사용할 수 있게 클래스를 만드는 방법
// 객체 생성자를 여러번 호출해도 메모리에는 최초 하나만 생성이 되게 클래스를 설계하는 방법
class MySingletonClass {
  // 1. 객체를 담아놓은 변수가 필요
  static MySingletonClass? instance;
  // 2. 생성자 즉 함수를 조금 변형시킨다
  // ?=> 생성자에서 1번 변수에 객체가 담겨있으면 기존객체, 아니라면 새로운 객체 생성
  // MySingletonClass() {
  //   // 이 안에서 로직을 실행할 수 있음
  //   // 객체를 생성하면서 로직 실행 가능
  //   // 이미 객체를 생성하고 로직 실행
  // }
  MySingletonClass._();
  // _ : 프라이빗 생성자 => 같은 파일 외 밖에서 사용 할 수 없음

  factory MySingletonClass() {
    // factory 생성자
    // 객체를 생성하기전에 로직을 실행할 수 있음
    if (instance == null) {
      instance = MySingletonClass._();
    }
    return instance!;
  }
}
