# Atomic Haibit 

 ### 습관 기록 어플리케이션 
- 효과적인 습관을 만드는데 필요한 기간은 `최소 66일`이다.
- 영국 런던대 임상심리학고 `제인 위들 교수`는 평균적으로 습관을 만드는 `66일`이 걸린다고 합니다. 
- 어플리케이션을 통해서 핵심습관을 만들고 더 나은 하루르 살아보는것이 어떨까요 

</br>

----

# 동작

![즐겨찾기](https://user-images.githubusercontent.com/51688166/182588740-0ad746f7-c781-4302-b12c-a832e584be77.gif)

![중복클릭 방지](https://user-images.githubusercontent.com/51688166/182588750-31d7d2d8-6783-45b3-bed5-bc9a3636268d.gif)




----

</br>

# 주요기능 

1. 습관을 `등록` 할 수 있다. ( 최대 20개 ) 
2. 66일을 완료하게되면 `명예의 전당`에 등록된다. 
3. 습관 리스트에서 `즐겨찾기` 기능 
4. 습관의 `진행사항을 확인` 할 수 있다. ( 몇일동안 했는지 ) 

</br>

----

</br>


# 사용기술 


###  DataBase 
- `Realm`

### Library
- `Toast` 

### `UIKit`
- `UITableView` 
- `UICollectionView`
- `UIAlert` 


### Event 
`Delegate` , `segue`

### AutoLayout
- `StoryBoard` & `Code`

### UI 
- `Main.storyboard` & `.xib`

</br>

----

</br>

# 문제점

- 습관의 진행사항 : 하루가 지나야 클릭 할 수 있지만. 2일이나 3일이 지나도  바로 다음날의 습관처럼 기록이 된다.
>ex) 하루 습관을 기록하고 2일이 지났을때 
 o x x x x -> o x x o x x   이렇게 되는게 아니라 
 o x x x x -> o o x x x x 이런식으로 기록된다. 
 
- 동일한 습관을 등록 할 때, 등록한 습관이 명예의 전당에 있다면 데이터가 충될된다. 

- 삭제 기능 ( 테이블뷰 CheckVC 중에 고민 ) 
- 디자인 ( 기본 기능만 작동함 ) = 깔끔한 UI가 아님



