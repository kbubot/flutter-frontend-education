## 세윤 코멘트
#### 예외처리는 아주 잘하셨습니다. 한가지 팁을 드리자면 이렇게 지속적으로 호출되는 함수안에 생성자를 호출할 경우 메모리가 낭비될 수 있기 때문에 생성자는 함수 밖에서 호출하고 지정자를 사용하시면 됩니다.
```dart
 setState(() {
      if (btnVal == 'C') {
        equation = '0';
        result = '0';
      } else if (btnVal == '=') {
        expression = equation;
        expression = expression.replaceAll('*', '*');
        expression = expression.replaceAll('/', '/');
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'error';
        }
      } else {
        if (equation == '0') {
          equation = btnVal;
        } else {
          equation = equation + btnVal;
        }
      }
    });
```
<img width=300 src='https://user-images.githubusercontent.com/72601028/130030603-08eba4da-b5bd-416f-88d2-5ea8583e9f75.png'>

#### 전체적인 구조와 콜백함수의 사용이 좋았습니다.키패드를 Flexible로 좌우 나눈것도 인상깊었습니다. 하지만 좌우 높이 비율이 아쉽습니다. 
#### 비율로 크기를 나누고 싶다면 MediaQuery를 사용하시면 됩니다.
```dart
Flexible(
  child: Button(
       text: '9',
       w: MediaQuery.of(context).size.width/5,
       h: MediaQuery.of(context).size.height/10,
       callback: btnOnClick,
                                    )),
```

