# BlockingAndHidingApp-iOS
Blocking &amp; Hiding App

### 🔗Link

**Download**

개발은 완료되었으나, FamilyControls Entitlement 권한 승인 요청이 지연되어 배포하지 못함

[Family Contols 문서](https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_family-controls)에 소개된 [request permission](https://developer.apple.com/contact/request/family-controls-distribution)를 요청하고 답변 대기중

**Source**

https://github.com/doyeonjeong/BlockingAndHidingApp-iOS

**Figma**

https://www.figma.com/file/sNuhox6VOSGFn2xky7wISr/AppChadangi?type=design&node-id=63%3A205&mode=design&t=KboGWdJMa8fPZjnj-1

## 📖 상세 내용

<img width="280" alt="앱차단기1" src="https://github.com/doyeonjeong/BlockingAndHidingApp-iOS/assets/108422901/386d3a0d-8f3e-46ef-a979-5eb29fe5d638">
<img width="280" alt="앱차단기2" src="https://github.com/doyeonjeong/BlockingAndHidingApp-iOS/assets/108422901/02fe5b38-a594-482a-a54e-6974f2d5e47c">
<img width="280" alt="앱차단기3" src="https://github.com/doyeonjeong/BlockingAndHidingApp-iOS/assets/108422901/e1330521-9199-4ef9-844f-42d11800beb6">

<aside>
💡 ScreenTimeAPI를 이용한 앱 차단 & 숨기기 기능의 앱 입니다.

YouTube Shorts를 컨텐츠 중독에서 벗어나고자 직접 기획 & 디자인 & 개발했습니다.

ScreenTimeAPI는 2021, 2022년 WWDC를 통해 2차례 소개되었습니다.
iOS15 이상부터 적용 가능하며, 3가지 프레임워크를 통해 동작합니다.

이를 공부하기 위해 선배 개발자들에게 공식 문서를 보면서 모르는 부분,
키워드 관련 고민을 적극적으로 나누며 Apple 공식 문서 기반의 프로그램 개발을 완료했습니다.

</aside>

<aside>
💡 처음엔 YouTube만 차단하는 앱으로 구현중이었으나 단일 AppToken을 생성하는 기술 구현에 막히고, 동료와 함께하지 못하게되면서 배포를 위해 혼자서 다시 시작했습니다.

**당시 작성했던 기획서와 Source :** https://github.com/doyeonjeong/Tublock [Tublock PRD(제품 요구 사항 정의서)](https://www.notion.so/Tublock-PRD-ce15af7e553d485dbc3ff7a120ee0758?pvs=21) 

</aside>

## 🛠️ 사용 기술 및 라이브러리

- Swift, iOS
- UIKit, SwiftUI
- UIHostingController
- ScreenTimeAPI - Family Controls, Managed Setting, Device Activity
- Firebase Console

## 📱 담당한 기능

- 그라데이션 UI 구현
- 스크린 타임 권한 요청
- SnapKit으로 Code-base 오토 레이아웃
- 선택된 앱 차단 & 차단 해제 기능 구현
- 차단 해제 전까지 하루종일 유지되도록 스케줄 설정

## 💡 깨달은 점

- WWDC 영상 2개와 공식문서를 탐방하며 얻은 지식으로 기능 구현
- GitHub 이슈탭의 Milestones, Labels를 이용한 프로젝트 일정 관리
- PR 작성시 문서화 습관 : https://github.com/doyeonjeong/Tublock/pull/59
- Commit Message 컨벤션
- UIHostingController로 UIKit과 SwiftUI를 같이 사용
- `_`를 변수명, 함수명 앞에 붙여 private 한 변수임을 명시적으로 표현
- Firebase Console를 통해 테스터 앱 배포

## 📄 문서화

[Screen Time API 알아보기 (1)](https://velog.io/@debby_/WWDC-Screen-Time-API)

[Screen Time API 알아보기 (2)](https://velog.io/@debby_/Whats-new-in-Screen-Time-API)
