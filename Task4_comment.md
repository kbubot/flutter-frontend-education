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
## 나영 코멘트
### 페이지를 하나하나 작성하신 것이 아주 좋았습니다. 프론트 코드는 한눈에 보이는 코드를 위해 적은 index는 반복문을 사용하지 않습니다. 그렇기에 프론트 코드로는 아주 좋았습니다.
```dart
children: <Widget>[
        Container(
            color: Colors.white.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Introduction Screen',
                  style: TextStyle(fontSize: 30,
                      color: Colors.black,
                      fontWeight:FontWeight.bold),
                ),
                Text(
                  '1 번째 스크린',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                )
              ],
            )
        ),
        Container(
          color: Colors.white.withOpacity(0.5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                Text(
                  'Introduction Screen',
                  style: TextStyle(fontSize: 30,
                      color: Colors.black,
                      fontWeight:FontWeight.bold),
                ),
                Text(
                  '2 번째 스크린',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                )
              ]
          ),
        ),
        Container(
          color: Colors.white.withOpacity(0.5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                Text(
                  'Introduction Screen',
                  style: TextStyle(fontSize: 30,
                      color: Colors.black,
                      fontWeight:FontWeight.bold),
                ),
                Text(
                  '3 번째 스크린',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
              ]
          ),
        ),
        Container(
          color: Colors.white.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Introduction Screen',
                style: TextStyle(fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '4 번째 스크린',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    minWidth: 20,
                    height: 30,
                    child: RaisedButton(
                      child: Text('Done'),
                      textColor: Colors.white,
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>ListContainer()),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
```
### 비동기 통신에 예외처리한 것도 좋았습니다. 모두 예외처리를 습관화 합시다:)
```dart
Future<List<Post>> fetchPost() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    List list=jsonDecode(response.body);
    var postlist = list.map((element)=>Post.fromJson(element)).toList();
    return postlist;
  } else {
    throw Exception('Failed to load post');
  }
}
 ```
 ## 예나 코멘트
 ### 리스트에 하단에 바를 넣으 것이 아주 좋았습니다.
 <img width='300' src='https://user-images.githubusercontent.com/72601028/131245402-87e4cd4e-2271-44eb-adc5-3b5169a2d095.png'>
 
 ### 예나도 비동기 예외처리와 페이지를 각각 나눈 것도 아주 좋았습니다.
 
 ## 전체적으로 다들 잘 하셨습니다.:)
