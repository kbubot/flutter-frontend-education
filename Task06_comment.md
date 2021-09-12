## 나영 코멘트
### 프로바이더를 사용하는 테스크는 완벽합니다.하지만 제가 저번부터 말한 back버튼이 보이지는 않지만 기능이 작동하고 있습니다. 이부분은 신경썼으면 좋겠습니다.
<img width=300 src='https://user-images.githubusercontent.com/72601028/132981544-b54db6df-37a8-43b5-b0e5-aab6a5883722.png'>

## 세윤 코멘트
### 프로바이더는 잘 사용하셨습니다. 하지만 페이지가 스크롤이 되어 다음페이지로 넘어가집니다. 
<img width=300 src='https://user-images.githubusercontent.com/72601028/132981762-0fc7b880-b2fd-48a4-b388-8b68eabbb2ff.png'>

## 예나 코멘트
### 버튼 오른쪽에 픽셀이 깨지는 부분이 생깁니다.이것도 width를 절대적인 크기가 아닌 상대적인 크기(비율)를 사용하시면 바로 고쳐집니다.
<img width=300 src='https://user-images.githubusercontent.com/72601028/132982045-06d06eb3-5c7c-4dde-b856-6639e4b366e7.png'>

### 이런식으로 비율로 하시면 됩니다.
```dart
child: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/6, 0, 0, 0),
 ```
 <img width=300 src='https://user-images.githubusercontent.com/72601028/132982149-0ae14833-d04e-431f-a1bf-5103820cf4eb.png'>
 
 ### 예나씨도 나영씨랑 같이 back버튼이 보이지는 않지만 기능을 하고 있습니다.이부분은 신경썼으면 좋겠습니다.
