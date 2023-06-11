<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border:1px solid #c7c7c7;
		background-color:#dddddd;
		border-radius:10px;
	}
	button, input{
		border:1px solid #dddddd; 
		border-radius:10px;
		font-size:1.5em; height:50px;
		color:#ffffff;
	}
	button.key_type1{
		width:204px; background-color:#7b7b7b;
	}
	button.key_type2, input.key_type2{
		width:100px; background-color:#373737;
	}
	button.key_type3, input.key_type3{
		width:100px; background-color:#fa960a;
	}
	#lcd{
		background-color:#70c738; font-size:40px;
		color:#373737; font-weight:bold; 
		text-align:right; border-radius:10px;
		padding:10px;		
	}
	h2{
		text-align:center;
	}
</style>
<script type="text/javascript">
	
//화면의 숫자를 무조건 0으로 만들어줌
function clearScreen(){
	document.getElementById("lcd").innerHTML = 0;
	document.getElementById("tempLcd").value = "";
	document.getElementById("tempOper").value = "";
}

function backSpace(){
	
	//1.LCD창에 입력된 텍스트 가져오기
	var lcdStr = document.getElementById("lcd");
	var tempLcd = document.getElementById("tempLcd");
	var tempOper = document.getElementById("tempOper");	
	
	//2.텍스트의 길이를 알아내기
	var strLen = parseInt(lcdStr.innerHTML.length);	
	
	//3.텍스트의 가장 오른쪽 문자 하나를 잘라내기
	lcdStr.innerHTML = 
		lcdStr.innerHTML.substr(0, (strLen-1));
	tempLcd.value = tempLcd.value.substr(0, tempLcd.value.length-1);
	tempOper.value = "";
	
	//4.모든 텍스트가 지워지면 0으로 초기화
	if(lcdStr.innerHTML==""){
		lcdStr.innerHTML = 0;
	}	
}

function inputNum(param){
	
	var lcd = document.getElementById("lcd");
	var tempLcd = document.getElementById("tempLcd");
	var tempOper = document.getElementById("tempOper");
	
	/*
	최초 입력시 lcd창에 0이 입력되어 있다면 0을 지운후
	숫자를 입력해야 한다. 그렇지 않으면 01과 같이 숫자가
	입력될 것이다.
	*/
	if(parseInt(lcd.innerHTML)==0){
		lcd.innerHTML = "";
	}
	
	
	if(param=="="){
		//=을 누를경우 계산의 결과가 출력되어야 한다.
		calculate();
	}
	else if(param=="+"||param=="-"||param=="*"||param=="/"){
		//산술연산자가 눌러지면 lcd창에는 아무것도 표시
		//하지않고 임시저장소에만 입력한다.

		if(tempOper.value==""){
			//연산자를 처음 입력했다면 숫자뒤에 연산자를
			//붙힌다.
			tempLcd.value = tempLcd.value + param;
		}
		else{
			//연산자를 두번이상 입력했다면 연산자만 바꾼다.
			tempLcd.value = 
				tempLcd.value.substr(0, 
					tempLcd.value.length-1);
			tempLcd.value = tempLcd.value + param;
		}
		//연산자라면 연산자 임시저장소에 저장한다.
		tempOper.value = param;		
	}
	else{
		//숫자가 눌러지면 연산자가 있는 상태인지 확인한다.
		if(tempOper.value==""){
			//연산자가 없는 상태라면 숫자를 연결한다.
			lcd.innerHTML += param;	
		}
		else{
			//연산자가 있다면 숫자를 다시 입력한다.
			lcd.innerHTML = param;
		}
		//임시Lcd창에는 계속 연결한다.
		tempLcd.value += param;	
		//숫자를 눌렀다면 연산자는 지운다.
		tempOper.value = "";
	}
}
function calculate(){
	
	var lcd = document.getElementById("lcd");
	var tempLcd = document.getElementById("tempLcd");
	var tempOper = document.getElementById("tempOper");
	
	//계산전 마지막으로 누른키가 연산자라면 하나를 지움
	if(tempOper.value!=""){
		var result = eval(tempLcd.value.substr(0,
				tempLcd.value.length-1));
	}
	else{
		//숫자가 마지막으로 눌러졌다면 바로 계산
		var result = eval(tempLcd.value);
	}
	
	//계산된 결과를 lcd창에 표시함
	lcd.innerHTML = result;
	tempLcd.value = result;
	tempOper.value = "";//연산자는 지움
	
	//결과가 소수점인 경우 소수점 둘째자리까지 표현하기
	/*lcd.innerHTML = result.toFixed(2);
	tempLcd.value = result.toFixed(2);*/
}
</script>
</head>
<body>
	<h2>계산기Ver2.0</h2>

<!-- 작성후 hidden 속성으로 변경 예정 -->
<input type="hidden" id="tempLcd" style="color:red; text-align:right;" />
<input type="hidden" id="tempOper" style="color:red; text-align:right;" />	

	
	<!-- table>tr*6>td*4 -->
<table align="center">
<tr>
	<!-- 디스플레이창 -->
	<td colspan="4" >
		<div style="width:410px;overflow:hidden;">
			<div id="lcd" width="100%">0</div>
		</div>
	</td>
</tr>
<tr>
	<!-- Backspace, Clear버튼 -->
	<td colspan="2">
		<button class="key_type1" 
			onclick="backSpace();">Backspace</button>
	</td>
	<td colspan="2">
		<button class="key_type1"
			onclick="clearScreen();">C</button>
	</td>			
</tr>
<tr>
	<td><input type="button" value="1" class="key_type2"
		onclick="inputNum(this.value);"/></td>
	<td><input type="button" value="2" class="key_type2" 
		onclick="inputNum(this.value);" /></td>
	<td><input type="button" value="3" class="key_type2" 
		onclick="inputNum(this.value);" /></td>	
	<td><input type="button" value="+" class="key_type3" 
		onclick="inputNum(this.value);" /></td>	
</tr>
<tr>
	<td><button class="key_type2" 
		onclick="inputNum('4');">4</button></td>
	<td><button class="key_type2" 
		onclick="inputNum('5');">5</button></td>
	<td><button class="key_type2" 
		onclick="inputNum('6');">6 </button></td>
	<td><button class="key_type3" 
		onclick="inputNum('-');">-</button></td>
</tr>
<tr>
	<td><button class="key_type2" 
		onclick="inputNum('7');">7</button></td>
	<td><button class="key_type2" 
		onclick="inputNum('8');">8</button></td>
	<td><button class="key_type2" 
		onclick="inputNum('9');">9</button></td>
	<td><button class="key_type3" 
		onclick="inputNum('*');">×</button></td>
</tr>
<tr>
	<td><button class="key_type2" 
		onclick="inputNum('=');">=</button></td>
	<td><button class="key_type2" 
		onclick="inputNum('0');">0</button></td>
	<td><button class="key_type2" 
		onclick="inputNum('.');">.</button></td>
	<td><button class="key_type3" 
		onclick="inputNum('/');">÷</button></td>
</tr>
	</table>
</body>
</html>