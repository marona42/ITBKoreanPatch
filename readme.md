# 인투더브리치 한글패치
이 레포지토리는 게임 [Into the Breach](http://subsetgames.com/itb.html) 1.2 버전 이상을 지원하는 한글 패치입니다.
## 패치 적용방법

이 레포지토리를 [다운로드](https://github.com/marona42/ITBKoreanPatch/archive/main.zip) 해 인투더브리치가 설치된 폴더에 덮어쓰기 하면 됩니다.  

- 단, resource.dat의 경우 용량의 문제로 __따로 다운받아야 합니다__.  
  - [구글 드라이브 업로드](https://drive.google.com/file/d/1I6SxLHsE6vhBt9W1z1CmVSrLqiUNethH/view?usp=sharing)  
  다른 다운로드 수단이 지원되면 추가하겠습니다.

  - resource.dat의 경우 원본 파일에 한글 글꼴 데이터가 병합된 것으로, 한 번 받으면 그 이후 다시 받지 않아도 됩니다. 하지만, 글꼴 파일이 변경된 경우 다시 받아야 합니다.

## 번역 원칙

- 기본적으로 음역이 아닌 완역을 원칙으로 합니다.
  - Vek 유닛의 이름은 음역을 합니다.
  - 완역이 어려운 고유명사의 경우 음차나 원어 표기를 합니다. (i.e. R.S.T, 리프트 워커)
- 외국 문화와 관련 있는 요소는 번역자 재량에 따릅니다.
  - 국내에 잘 알려진 요소는 그대로 넣습니다.
  - 잘 알려지지 않은 요소는 한국 문화에서 비슷한 요소를 따다 넣습니다.
- 라이센스상 문제가 없는 에셋만을 사용하고 그 사용 내역을 이 곳에 명시합니다. (글꼴, 이미지등)  

## 패치 구현방식

패치 파일은 에픽스토어 배포판을 기준으로 만들었습니다.  
1.2 버전을 기준으로 새로 제작하는 한글패치입니다.  
현재 이탈리아어 현지화 데이터를 덮어쓰기 한 방식으로 구현되었습니다.  
크레딧 표시의 한국어 번역란은 중국어 번역팀 크레딧을 덮어쓰기 했습니다.  

## 메모

현재 이 번역은 marona42@Team Spirit이라고 적어뒀으나 개인이 진행중입니다.
Pull Request, Issue tracker 추가, 이메일 등 기여는 어떤 방법으로든 환영입니다.

### 필요한 일

1. - [x] 글꼴 선정  
   - 더 좋은 글꼴을 찾으면 변경 될 수 있습니다!
2. - [ ] 1차 번역  
3. - [ ] 고유명사 통일  
4. - [ ] 2차 번역  
5. - [ ] 번역 검수  
6. - [ ] 글꼴 데이터 최적화  
7. - [ ] subsetgames와 연락해 공식 번역으로 선정되기  
  
### 번역 현황

| 번역 텍스트      | 번역완료 | 총 분량 | 검수 |
|------------------|----------|---------|----|
| Achievements.csv |    155   |   155   |    |
| Global.csv       |    869   |   869   |    |
| Missions.csv     |    180   |   406   |    |
| New.csv          |    264   |   264   |    |
| Objectives.csv   |    144   |   145   |    |
| Pawns.csv        |    134   |   135   |    |
| Pilots.csv       |    736   |   4714  |    |
| Population.csv   |    123   |   123   |    |
| Tooltips.csv     |    241   |   241   |    |
| Weapons.csv      |    541   |   542   |    |
 
 - Pilots.csv 의 일부 번역(a672bcd744201f3902eae86b7ca037ea623759eb)에 [flameblast12](https://github.com/flameblast12) 님이 참여(#1)해주셨습니다. 감사합니다. 

### 사용한 에셋

- [네오둥근모 프로젝트](https://github.com/Dalgona/neodgm) : 사용된 한글 글꼴  
- [도스 글꼴](https://github.com/hurss/fonts) : 사용된 한글 보조 글꼴  
- [FTL UnPacker](https://subsetgames.com/forum/viewtopic.php?t=2788) : resource.dat 에 한글 글꼴 병합
