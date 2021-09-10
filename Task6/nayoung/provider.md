# Provider

  >  Provider는 앱을 구성하는 모든 화면에서 사용할 수 있으므로 앱의 가장 큰 단위인 Material App를 감싸는   방식으로 구현한다.
  >  
 **Provider 가 주목받게 된 배경**
Provider는 올해 google io에서 추진되면서 큰 주목을 받았다. 

##  Provider란?
위젯 트리와 상관 없이 상태(데이터)를 저장할 클래스를 생성하고, 해당 상태를 공유하는 공통 부모 위젯에 Provider를 제공하고, 상태를 사용하는 곳에서는 Provider의 데이터를 읽어서 사용하게 된다.

##  Provider 패턴을 쓰는 이유

 **1. 관심사의 분리 ( separation of concerns)**
관심사의 분리는 디자인 원칙 중 하나이다.
한 클래스가 여러 역할을 할 수록, 클래스가 커지고 관리는 어려워진다. 이러한 이유 때문에  클래스가 하나의 관심만 갖도록 클래스를 나눈다. 여기서 나누기 위해 사용되는 것이 Provider패턴이다.
 **2. 데이터의 공유**
하나의 데이터를 여러 페이지에서 공유하고 싶을 때 Provider패턴을 이용하여 쉽게 공유한다.

> **??**
>  Provider패턴말고 다른것을 이용해서 하면 안되나요? 
> =>  새로운 정보를 많이 불러오게 되면 앱이 복잡해지고 비용도 많이 들게 된다.
**> 그래서 가장 적합한 방법인 Provider패턴을 이용한다.**

 **3. 좀 더 간결한 코드**
 Provider패턴을 사용하면 더 적은 코드로 클래스들을 구분해서 사용할 수 있다.

> google에서 추천하는 방법 ! 
> 중규모 프로젝트 => Provider 패턴 
> 대규모 프로젝트 => Bloc 패턴

##  Provider 구조
Provider는 데이터를 생산하고 소비하는 부분으로 나누어져 있다. 어떤 데이터를 생산하느냐에 따라서 **Provider의 종류**가 달라진다. 
## Provider 사용

 **1. 패키지 추가**
(pubspec.yaml 파일에 Provider 플러그인을 추가)
> dependencies:  	
	 	provider: ^3.1.0+1
> 
**2. 클래스 구현**
만약 값을 변경할거면 **notifyListeners메서드**를 꼭 호출해줘야 한다.

 **3. ChangeNotifierProvider 사용하기 - 변하는 값 처리하기**
 UI에 있는 값이 변했을 때, UI를 변경해줘야 한다. ChangeNotifierProvider를 mixin한 클래스는 notifyListeners() 함수를 부를 수 있다. 
> notifyListeners() 함수를 사용하면 UI가 업데이트 된다.



