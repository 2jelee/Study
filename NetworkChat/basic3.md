대부분 기능>> 서버에서 처리

echo시스템

[귓속말]
/명령어 Hi
/to 대화명(client)
>> 서버가 "/"를 인지하여 귓속말임을 판단함
귓속말 받는 상대 뿐만 아니라 
다른 client들에게도 echo되고 판단하여 보임/숨김 처리가 된다.

접속) cd \02Workspaces\K01NetworkChat\bin
	-> java chat7.MultiServer(or MulitClient)

String
split함수 010-1111-1111
 구분자(이 경우, -)를 통해 쪼개는... Stirng[] >>배열

=======================================

현 프로젝트를 진행하며 ) 특정 사람의 PrintWriter찾는 것이 중요하다.

중복아이디
똑같은 아이디의 경우 accept수정 >> set확인

fixto >> 컬렉션

공통설정까지는 완료해야 한다.

개인설정 -> 공통설정 -> 서버설정 (난이도)

접속자리스트 출력
: map을 한바퀴 돌리면 된다.



=========================================
[개인설정]

1. 귓속말
1회용 설정 ⇒  /to 대화명 대화내용 (이미구현되어있음)

고정 설정 ⇒  /fixto 대화명
>> if를 사용하여..
만약 입력, /fixto >> 무한루프 or do~while문

*무한루프
반복을위한변수;
			while(반복조건){
				실행문;
				탈출을위한 증감식;
			}

do~while문
	: 반드시 한번은 실행해야 할 경우 사용하는 반복문.
	즉 조건검사없이 무조건 한번은 실행된다. 
	형식]
		반복을 위한 변수;
		do{
			실행문장;
			반복문을 탈출하기위한 증감식;
		}while(조건식); <= 반드시 문장끝에는 세미콜론이 있어야한다.

while(True) { 
	System.out.println("i번째"); 
	i++; 
	if(i == 5) { 
	break; 
	} 
}




설정을 해제할때까지 계속적으로 귓속말을 보내는 기능이다.
해제시 ⇒  /unfixto 대화명
2. 대화상대 차단 ⇒ /block 대화명
해당 사용자가 메세지를 보내면 나한테는 수신되지 않는다.
해제시 ⇒ /unblock 대화명
3. 접속자리스트 출력
/list ⇒ 자신을 제외한 모든 접속자의 대화명을 출력한다.  



```
MultiClient
new Socket.. 소켓 객체 >> 접속 요청을 보냄.

서버, 클라이언트의 out, in은.. 형태는 같지만 다른 것임.
서버가 먼저 무언가를 하지는 X. 클라이언트에게 응답을 할뿐.