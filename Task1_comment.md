## 예나코멘트

#### 이부분에서 비동기를 이용하지 않고 생성자를 오버라이딩하여 딜레이를 준 것이 좋았습니다.
```dart
 @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Counter()));
    });
  }
```
## 세윤코멘트

#### 세윤씨도 이부분에서 오버라이딩을 이용하여 딜레이를 준 것이 좋았습니다.또한 Appbar를 같은 색으로 통일한 것도 좋았습니다.
```dart
 @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Counter()));
    });
  }
```
#### 아쉬운 점은 Appbar좌측에 뒤로가기 버튼이 아직 존재하는 것 입니다. 보이지는 않지만 기능은 아직 작동하므로 앞으로 앱을 만드실 때 주의해주시기 바랍니다.
<img width=300  src="https://user-images.githubusercontent.com/72601028/129464554-50c0a0b4-4716-4691-a337-f8dfec041e12.png" >

## 나영코멘트

#### 나영씨도 오버라이딩으로 딜레이 준 것이 좋았습니다. 또 Container에서 padding값을 주는 것도 이상 깊었습니다.
```dart
 @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Counter()));
    });
  }
```
```dart
 body: Container(
          padding: const EdgeInsets.all(16.0),
```
#### 컨텐츠가 중간에 위치하지 않고 Appbar바로 아래에 존재하는 것이 아쉬웠습니다.
<img width=300 src="https://user-images.githubusercontent.com/72601028/129464720-af99a7a2-574e-405b-92fe-972fe64655aa.png">

##### 아래의 소스로 중간으로 바꿀 수 있습니다. 
```dart
child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
```
