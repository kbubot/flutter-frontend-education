# Task6

# Provier 패턴

### 🧐 provider의 배경

커뮤니티에서 만든 플러그인으로 커뮤니티에서

사용하다가 구글에게 관심을 끌게되면서 많은 사람들에게

관심을 끌게되었고 구글도 공식적으로 추천을 하게되었다.

이전까지 구글은 Bloc 패턴을 사용할길 권장하였고

플러터의 경우UI도 코드로 구성되어 있다보니 

코드가 한 클래스로 몰리게 되면서 가독성과 분배에 대해서 

문제가 생기게 되었습니다.

이를 해결하기 위해 나온것이 바로 Bloc 패턴입니다.

하지만 Bloc패턴의 경우 문제를 해결하기는 하였지만 사용의 

어려움을 많은 사람들이 겪었고 이를 불편히 여겨 

만들어진게 바로 provider 패턴인것입니다.

### 👍 provider의 의의

1. 분리의 기능

플루터를 사용하게되면 

- 자연스럽게 UI와 로직(데이터 처리) 를 한꺼번에 코드로 적는 경우가 빈번하게 됩니다.

    간단한 경우에는 큰문제가 생기지 않겠지만 클래스가 여러역할을 가지게 될수록

    코드의 양은 많아질것이고 관리하기에도 어렵게되죠 

    하지만 provider를 쓰게되면 크게 나눠서 UI부분과 로직(데이터처리) 부분을 나누어 

    관심사를 분리시킬수 있고 한쪽에 문제가 생기더라도 분리시킨 부분을 찾아서 

     작업을 하게된다면 훨씬 편하게 될것입니다. 

2.  데이터 처리

provider 패턴을 쓰지않고 데이터 처리를 하게된다면 

- 중복해서 사용되는 데이터의 경우 데이터의 중복성으로 인하여

     손실이 올것이고 새로 데이터를 불러오게 될때마다 점점  복잡해지므로

     비용적으로 좋지않게됩니다.

     하지만 provider 패턴을 쓰게된다면 이런 데이터 공유를 쉽사리 

     이용할수 있고 데이터의 중복성이 낮아져 비용적으로 좋은결과를 얻을수있습니다.

3. 가독성

1번과 마찬가지로 분리를 하게되면서 필요한 부분을 분리하였기 때문에 

- 필요한 부분을 찾아서 보기 쉬울뿐더러 코드가 간결해지기 때문에

       각각의 코드가 어떤일을 하는지 파악하기 쉬워집니다.

### 🦴 provider의 구조

provider는 생산과 소비 라는 2부분으로 구성되어있습니다.

- 이름그대로 생산을 할때도 있고 소비를 할때도 있습니다.

### 🤖 생산

생산하는 방법은 간단합니다 

- 생산하려는 데이터를 부모위젯인

       provider로 감싸서 사용하는것입니다

       provider<>.value(

       value:  ,

       child:  자식위젯(감싸여질 )

        )

       ChangeNotifierProvider(

       create: (BuildContext context) => 사용할 데이터(),

       child: 자식위젯,

        ))

ChangeNotifierProvider

변하는 값 처리하기

- 보통 상태를 저장하는 기능을 가진것은

      Statefulwidget 에서 setstate로 많이 사용하게되지만

      변하는 값을 처리할수있는

      ChangeNotifierProvider를 사용함으로써

      Statelesswidget 라도 상태를 저장함으로써

      stf위젯의 기능을 stl이 수행할수 있게됩니다.

### 💸 소비

Provider.of(context)

- Build context 해당 클래스 안에 있는 context의 값을 찾아 올라가면서

      provider를 소비하는 형식입니다 

### 💬 여담

- 소규모 프로젝트나 개인프로젝트의 경우

      provider 패턴을 자주 사용하고

      대규모 프로젝의 경우는 

      Bloc 패턴을 자주 사용한다 합니다.

      그렇기 때문에 provider 패턴만 사용하는 것이 아니라

      Bloc 패턴도 쓸줄 알아야 하겠죠?

### 🌝 느꼇던점

- 기존에는 파일을 구성하게 되면 페이지를 단위로 여러 파일을 만들었습니다.

      기존에 그렇게 썻던 이유는 페이지를 메인 페이지의 다 담기에는 가독성이 

      좋지 않아 보였고 실제로 작업할때도 수정하기가 어려웠습니다.

       이번 Provider패턴을 보면서 페이지를 여러파일로 나눈다는 것과는 엄연히

       다르지만  작업의 효율성면에서 깊게 감탄했던 것 같습니다.

       앞으로는 페이지를 단위 파일을 구성하기 보다는 UI 파일 로직 파일로 구성하여

      좀더 효율적인 프로그램을 작성해야겠다고 생각이 들었습니다.