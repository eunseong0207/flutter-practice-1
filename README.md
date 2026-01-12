# Freezed 사용법

1. 패키지 추가

```sh
flutter pub add \
  dev:build_runner \
  freezed_annotation \
  dev:freezed
# if using freezed to generate fromJson/toJson, also add:
flutter pub add json_annotation dev:json_serializable
```

2. 클래스 작성 (freezed 문법대로)

3. 코드생성
```sh
dart run build_runner watch -d
```

4. `.gitignore`에 생성된 파일 안올라가게 추가
```
.gitignore 파일에 추가
* > 앞에 파일명 상관 없이 . 뒤에 내용이 똑같으면 올리지 않는다
*.freezed.dart
*.g.dart
```