## 세윤 코멘트
#### 흠 잡을 곳이 없고 Task이미지와 똑같으며 기능에도 에로사항이 없습니다.잘 하셨습니다:)

<img width=300 src="https://user-images.githubusercontent.com/72601028/130308380-e6ccaeeb-8536-45d4-af20-8b19619fd6be.png">

## 나영 코멘트
#### Task와 똑같으며 기능에도 에로사항이 없습니다. 잘 하셨습니다:).

<img width=300 src="https://user-images.githubusercontent.com/72601028/130308503-08871f95-d584-444d-8978-62e1669f489d.png">

#### Flexible을 사용하지 않고 비율을 맞춘 것이 인상 깊었습니다.이미지에 패딩 값을 주어 비율을 잘 맞추셨습니다.
```dart
Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          "${bookstore[index%2]["picture"]}",width: 120,
                        ),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child:Container(height:30,
                                    child:Text('${bookstore[index%2]["book_name"]}',
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child:Container(
                                  height:20,
                                  child:Text('D-$D_Day',
                                    style: TextStyle(
                                        color: Colors.white),),color: Colors.cyan,),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child:Container(height:50,
                              child: Text(
                                '${bookstore[index%2]["writer"]}',
                              ),),
                          ),
                          Container(
                            child: Text('대출일-반납일 : '
                                '${bookstore[index%2]["borrow_date"]}-${bookstore[index%2]["return_date"]}'
                              ,),)
                        ],
                      )
```
## 예나 코멘트
#### Task와 이미지,기능 모두 같습니다. 하지만 한 가지 아쉬운 것은 이미지에 패딩값이 많이 들어가서 전체적으로 작은 느낌이 납니다.하지만 구도상 안정적인 느낌을 주기 때문에 좋았습니다.
<img width=300 src="https://user-images.githubusercontent.com/72601028/130308739-7463d26b-ec16-4856-800a-1f08f0560842.png">
