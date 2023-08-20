# <img width=25px src=https://github.com/SEOKJUN-KO/FinlandSauna/assets/77708819/9e14f6cb-6dca-45ee-b819-6b740d5f880e> TranSoluM-JunctionAsia2023-FinlandSauna

> **Junction Asia 2023** <br>
> **Project Period : 2023. 08. 18 ~ 2023. 08. 20.**

![image](https://github.com/SEOKJUN-KO/FinlandSauna/assets/77708819/5dc11ce0-ed94-40df-be08-f4cd79191236)

An innovative solution that delivers a real-time Translation based on the user location.

## 🔑 Key Point
 - "TranSOLUM" utilizes the Bluetooth communication offered by SoluM’s Gateway to track users' indoor location. This enables us to provide real-time translated information on nearby ESLs based on the user's movements.

## 💼 Buisness Value
![image](https://github.com/SEOKJUN-KO/FinlandSauna/assets/77708819/fea68103-2fb1-4489-8752-83b48bfa5abb)
- **🏭 In B2B**
    - TranSOLUM could mitigate challenges faced in small to medium-sized logistics centers where non-Korean-speaking foreign workers struggle due to language barriers.
    - By translating information into their primary language, TranSOLUM is expected to decrease errors and enhance their efficiency.

- **🙋‍♂️ In B2C**
    * We translate product info for foreign mall visitors using SOLUM's ESL

- **🇰🇷 In B2G**
    * In B2G, we can offer services like translating public signs, transit guides, and emergency info, partnering with governments to serve growing foreign tourist and multicultural needs.

## ⚒️ Technique
![image](https://github.com/SEOKJUN-KO/FinlandSauna/assets/77708819/51a0c0b7-86db-4cc7-aee5-7d4d38bc46a4)

## 👨‍👨‍👦‍👦 Team Members
<table>
  <tr>
    <td align="center"><a href="https://github.com/seunggyun-jeong"><img src="https://github.com/seunggyun-jeong.png" width="200px;" alt=""/><br />Seunggyun Jeong<br />(iOS Developer)</td>
    <td align="center"><a href="https://github.com/SEOKJUN-KO"><img src="https://github.com/SEOKJUN-KO.png" width="200px;" alt=""/><br />Seokjun Ko<br />(iOS Developer)</td>
  <td align="center"><a href="https://github.com/psangwon62"><img src="https://github.com/psangwon62.png" width="200px;" alt=""/><br />Sangwon Park<br />(iOS Developer)</td>
          <td align="center"><a href="https://github.com/OreobrO"><img src="https://github.com/OreobrO.png" width="200px;" alt=""/><br />Mingyu Choi<br />(UX/UI Designer)</td>
             <td align="center"><a href="https://github.com/Joy19061618"><img src="https://github.com/Joy19061618.png" width="200px;" alt=""/><br />Hosic Cho<br />(Entrepreneur)</td>
        </tr>
</table>

## 🖊️ Convention
<details>
<summary>Open</summary>
<aside>
👉 로컬에서 수정한 코드를 깃허브에 올리려면 commit을 하게 되는데요, 어떤 부분이 수정되었는지 설명하기 위해 커밋메시지를 작성합니다.

</aside>

- 해당 작업을 진행하지 않은 사람도 커밋메시지에 `요약된 내용만 보고도 무슨 내용인지 추측하게 쉽게끔` 작성하는 것이 중요해요!
- 아래와 같은 형식으로 작성하면 됩니다.
    
    ```swift
    type: title
    
    body
    
    ```
    
- title과 body 사이 한칸 띄워주셔야 합니닷
- `type`: **어떤 의도**로 커밋했는지를 명시합니다
    - type의 종류
        - `feat`
            
            → 새로운 기능을 추가했을 경우
            
            → 이슈에 적힌 작업을 진행했을 때 선택하면 됩니닷
            
            → 아마 가장 사용할 일이 많을거에요
            
        - `refactor`
            
            → 새로운 기능이나 버그 수정 없이 코드의 모양만 바꿨을 때
            
            → 변수명 수정이나, 함수 리팩토링 등등 코드 동작의 수정이 없을 때 선택하세요
            
        - `fix`
            
            → 버그 또는 오탈자를 고친 경우! 
            
            → “내가 의도하지 않은 동작이면 모두 다 버그이다”
            
        - `style`
            
            → formatter 수정과 같은 사소한 수정일 때!
            
            → EX)
            
            ```swift
            // BEFORE
            Image("Tomato").resizable().scaledToFit()
            
            // AFTER
            Image("Tomato")
            	.resizable()
            	.scaledToFit()
            ```
            
        - `chore`
            
            → 코드 수정은 아니고, 프로젝트 관련 환경 설정할 때!
            
            → 에셋 변경, 폴더 구조 변경이나, 패키지 매니저 설정할 경우
            
        - `docs`
            
            → README 등 문서 관련 수정일 때!
            
        - `remove`
            
            → 사용하지 않는 파일이나 폴더를 삭제할 때!
            
        - `rename`
            
            → 파일이나 폴더명을 수정하는 경우!
            
- `title`: 수정한 내용을 모두 포함하는 한 줄로 작성합니다.
- `body`: **어떻게** 했는지가 아닌, **무엇을 왜 했는지**를 작성합니다.
    - 꼼꼼하게 쓸수록 좋아용
- EX)
    
    ```swift
    [Feat] #이슈번호 - 계단 카운트 기능 구현
    
    - 올라갈 때마다 워치에서 측정하는 기능 구현
    - 워치에서 받은 데이터를 아이폰에 연동 성공
    ```

## 브랜치 생성 방법
    
  ```swift
    type/#이슈번호
    
    ex) 
    feat/#02
    fix/#05
    add/#08
  ```

  <details>
