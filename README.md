# **Small-Scaled Wind Turbine Testbench for Bearing Fault Diagnosis** 

***School of Mechanical and Control Engineering***

***2022-2 Mechatronics Integration Project***



**Student: Jeongwoo Park**

**Advisor:**  **Prof.Youngkeun** **Kim**

-----------------------

본 연구는 풍력발전기의 실시간 모니터링의 필요성으로 인해 풍력발전기를 축소화한 테스트 벤치를 통해 데이터를 취득하고 풍력발전기의 부품인 베어링의 고장진단을 수행한 연구입니다. 

#### 1. Testbench

Testbench는 아래의 사진과  같이 3가지 유형의 실험(베어링 고장, 축정렬 불량, 질량 불균형)이 가능합니다. 이번 연구에서는 베어링의 고장, 축정렬 불량에 대한 실험만 진행했습니다.

데이터는 12kHz, 10sec으로 취득했고 현재 업로드한 데이터는 4000개씩 Split한 데이터를 따로 저장했습니다.



![image](https://user-images.githubusercontent.com/84221531/208964624-de3da554-c9ac-42ee-81f6-416f54acf72c.png)

#### 2. Bearing Fault Diagnosis

베어링 고장진단을 위해 CWRU dataset을 사용했을 때 99%이상의 성능을 보였던 최신기법 1D- CNN, 2D-CNN, CNN-LSTM 3가지를 선정했습니다. 

1D-CNN과 CNN-LSTM의 입력은 1차원이므로 진동데이터를 일정 주기로 Split하여 전처리 하였고

2D-CNN은 진동데이터를 통해 64X64의 이미지 데이터를 만드는 전처리를 진행하였다.



