## **FLUTTER**

StatefulWidget을 만들 때 State라는 오브젝트를 만든다.

**#State의 두가지 정의**
1.위젯에 의해서 사용되어지는 데이터는 변할 수 있다.
2. 위젯이 빌드 될때 데이터들을 동기적으로 읽을 수 없다. 모든 State들은 빌드함수가 호출될 때 까지 설정되어야 한다.

**1. #createState( )**
Framework가 StatefulWidget을 만들경우 createState()가 즉시 호출된다.
createState 함수는 buildContext가 state에 할당되게 된다. 
> (buildContext란 위젯트리를 단순하기 위해 필요한 것이다.)

**2. #mounted is true**
모든 위젯은 this.mounted : bool 속성을 가지고 있다. 즉 buildContext가 할당될 때 this.mounted 가 ture로 리턴된다.
state가 생성되었다는 정보를 mounted 프로퍼티에 넘긴다.
> 위젯이 unmounted일 경우에는 setState를 부를 경우 에러가 발생될 수 있다.

**3. #initState( )**
처음 시작하고 초기화단계에 호출
widget이 만들어지고 처음 메소드 실행할 때 initState함수가 실행된다. super.initState를 필수적으로 호출해야 한다.

**4. didChangeDependencies( )**
이 함수는 initState를 호출한 뒤에 실행된다. 
이 위젯은 데이터에 의존하는 객체가 호출될 때 마다 호출된다. (의존성이 변경될 시 호출한다.)
> Inheritedwidget에 의존하는 경우 업데이트를 한다.
> 
**5. #build( )**
필수적으로 오버라이딩해서 구현해야되는 함수이다. 위젯을 리턴한다.
실제 ui를 그리는 곳

**6. #didUpdateWidget(Widget oldWidget)**
만약 부모 위젯이 업데이트 되거나 위젯이 다시 만들어질 경우 이 함수가 호출된다.
Flutter는 state를 재사용한다. 이 경우 initState에서 값을 초기화  해야 한다.
state 위젯을 rebuild할 때 주로 쓰임.
> build함수가 변경할 수 있는 스트림이나 다른 개체를 사용하는 경우 이전 개체에서 구독을 취소하고
> didUpdatewidget에서 새 인스턴스에 다시 구독한다.

**7. #deactivate**
위젯 트리에서만 제거 되었을 때 호출한다.

**8. #dispose( )**
영구적인 state object가 삭제될 때 호출된다. 이 함수는 주로 stream이나  애니메이션을 해제할 경우 사용된다.

**9. #mounted is false**
state object가 다시 마운팅 되지 않을 경우 setState 호출시 에러를 리턴한다.
완전히 사라졌다는 정보를 mounted 프로퍼티에 넘긴다.
