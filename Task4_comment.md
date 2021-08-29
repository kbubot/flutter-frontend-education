## 세윤 코멘트 
### 저번에 말씀드린 비율을 사용하지 않을 경우 이렇게 좌우에 픽셀이 넘어가는 경우가 있습니다. 그러니 비율을 꼭 사용해야겠죠?:)
<img width='300' src='https://user-images.githubusercontent.com/72601028/131244396-49ee9059-51d4-434c-960d-6f382e851b66.png'>

### 데이터 로딩 중 예외처리 좋았습니다. 
```dart
 else {
            return Center(child: CircularProgressIndicator());
```

### 선언부에 ?가 무엇을 의미하는지 아시나요? 아시면 디코 공부 채팅 채널에 간단하게 써주시면 좋겠습니당 일단 ?사용이 좋았습니다.
```dart
List<Data>? data = snapshot.data;
```
