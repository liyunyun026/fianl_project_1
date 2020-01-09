# fianl_project_1
### Authors: 106321074 106322013

#### Input/Output unit:<br> 
* 8x8 LED 矩陣，用來顯示地鼠(2*2)，圖為初始畫面。(此為第一關，紅色地鼠，加一分)<br>
<img src="https://github.com/liyunyun026/fianl_project_1/blob/master/images/first.jpg" width="300"/><br>
*第二關紫色地鼠，加兩分。<br>
<img src="https://github.com/liyunyun026/fianl_project_1/blob/master/images/second.jpg" width="300"/><br>
*第三關白紫地鼠，加三分，綠色為干擾。<br>
<img src="https://github.com/liyunyun026/fianl_project_1/blob/master/images/third.jpg" width="300"/><br>
*LED 陣列，用來計分，顯示關卡。<br>
<img src="https://github.com/liyunyun026/fianl_project_1/blob/master/images/level_score.jpg" width="300"/><br>
*七段顯示器，用來顯示剩餘時間。<br>
<img src="https://github.com/liyunyun026/fianl_project_1/blob/master/images/time.jpg" width="300"/><br>
*到達設定積分上限顯示全白為結束畫面。<br>
<img src="https://github.com/liyunyun026/fianl_project_1/blob/master/images/end.jpg" width="300"/><br>

#### 功能說明:<br>
我們將8*8LED分成16格，並編號，使用switch來打地鼠(使用二進位輸入)，在時間內得到29分就獲勝。第一關8分就過關，第二關20分就過關。<br>

#### 程式模組說明:<br>
module LED_test_2(output [7:0]DATA_R, DATA_G, DATA_B, //紅色燈，綠色燈，藍色燈<br>
		  output [3:0]COMM,//控制亮燈排數<br>
		  input CLK,//頻率 <br>
		  output beep, //蜂鳴器叫聲<br>
		  input [3:0]A,//打地鼠(透過輸入位置打到地鼠)<br>
		  output [5:0]A_count,//計分<br>
		  output a,b,c,d,e,f,g, //七段顯示器<br>
		  input Clear, //時間清空<br>
		  output [1:0]level,// 關卡等級<br>
		  output [3:0]an//控制時間輸出位置<br>
                   );<br><br>
module divfreq (input CLK, output reg CLK_div);  // 除頻器
module change_1HZ(input CLK, output reg CLK_div1); //產生頻率
module twodigit_onefile //倒數計時器
各I/O變數接到FPGA I/O裝置：   <br>              
[7:0]DATA_R, DATA_G, DATA_B,[3:0]COMM ->接到8*8全彩點矩陣<br>
beep ->接到BEEP(蜂鳴器)<br>
[3:0]A ->4-bits SW<br>
[5:0]A_count ->接到16-bits LED(LED11~16)  <br>

[1:0]level ->接到16-bits LED(LED1~2)     <br>
a,b,c,d,e,f,g ->7 SEG X4(七段顯示器)<br>
[3:0]an ->7 SEG X4<br>
Clear ->8DIP SW<br>
*** 說明程式邏輯 <br>
我們使用(cnt2*5+3) % 16的規律產生不同位置的地鼠，當我們輸入的SW與地鼠位置相同，8*8LED全滅，蜂鳴器(beep <= 1)叫，當她出現下一隻地鼠時，蜂鳴器關掉(beep<=0)，第一關分數達到要進入第二關時。level=2,之後打到地鼠變加兩分，第二關分數達到要進入第三關時。level=3,之後打到地鼠變加三分。
