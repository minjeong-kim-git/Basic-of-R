# variable / 변수 ---------------------------------------

# 지금까지 자료유형 및 구조에 대해 공부하면서 어려 가지 다중연산을 경험했습니다.
# 예를 들면
cat(paste0(c('a', 'b', 'c'), collapse = ', ')) # a, b, c
factor(c(1, 2, 3, 4, 1, 2, 2, 1)) # 요인 벡터의 생성

# [1] 1 2 3 4 1 2 2 1
# Levels: 1 2 3 4

# 위처럼 함수 측에서 함수를 사용하는 행위가 반복되는 것을 알 수 있습니다.
# 그러나 변수, 즉 주어진 자료 및 값을 특정한 이름으로 저장하면 이러한 코드가 훨씬 읽고 쓰기 편하게 바뀝니다.

# 변수란, 주어진 객체나 자료를 담는 그릇이다.
# 변수는 주어진 값을 가리키는 메모리의 주소이다.

vec1 <- c('a', 'b', 'c') # <-는 assignment operator라고 한다.
vec1 <- paste0(vec1, collapse = ', ')
cat(vec1)

vec2 <- c(1, 2, 3, 4, 1, 2, 5, 1, 3)
factor(vec2)

# R에서 변수의 이름을 저장할 때 지켜야 할 규칙이 몇 가지 있습니다.

# var1. 기능: 문자, 숫자, .,_(unerscore) 가능
# var$ 불가능: 특수문자는 오직 ., _만 허용
# R에서 이미 의미나 명령이 지정되어 있는 operator, 변수 같은 것들을 reversed name이라 함.

# 2var_name 불가능: 숫자로 시작할 수 없음
# .var_name.var.name 불가능: .으로 시작 가능. 그러나,
# .2var_name 불가능: 뒤에 숫자가 와서는 안 됨.
# _var_name 불가능: 으로 시작할 수 없음.

# R 변수와 메모리

a <- 1:10
tracemem(a) # a라는 변수의 컴퓨터 메모리 안의 주소를 추적해 줌
# 10진수: 0, 1, .., 9
# 16진수: 0, 1, ..., 9, A(10), B(11), C(12), D(13), E(14), F(15)
b <- a
b[1] <- -1
# a의 복사본을 다른 주소에 저장한 뒤 그 주소에 저장된 a의 복사본을 b의 주소에 저장함.
untracemem(a) # 추적 종료

# function / 함수 ---------------------------------------------------

# 함수란, 입력값을 받아서 의도된 값으로 출력하는 규칙이다.
# y = x + 3이란 함수를 생각해보자. 이때 x + 3을 f(x)로 두고 y = f(x)라고도 한다.
# 프로그래밍에서 함수는 바로 이 f를 정의해주는 것을 의미하며, x + 3은 규칙인 것이다.

f <- function(x) x + 3 # x: 모수(parameter)
cat(f(2)) # 함수를 call하는 방법

f <- function(x) {
  x + 3
  x + 2
} # expression

f <- function(x) {
  return(x^2 + 3*x + 8) # return은 함수가 최종적으로 출력한 값이다.
}
# {}로 묶인 부분을 expression이라 한다.
# 함수의 정의에서의 expression은 함수가 call될 때 하나의 독립된 환경(environment)으로
# 취급된다. 따라서 크게 함수 바깥 환경과 함수 내부 환경으로 나뉜다고 볼 수 있다.

{
  cat(1-2, '\n')
  cat(3-4)
}
# 일반적인 expression!

# 변수의 SCope -------------------------------------------------


y <- '함수 바깥에서 정의된 변수'
my.function <- function(x) {
  cat(y)
}
my.function('모수 x에 주어지는 값')
# 함수 바깥에서 정의된 변수도 함수 내부에서 접근이 가능하다.

value <- my.function('모수 x에 주어지는 값')
value # cat이나 print는 값을 출력해주지는 않는다. 단지 콘솔에 출력할 뿐이다.
# 즉, 물리적으로 메모리를 차지하는 실제 값이 아니다.

my.funcion <- function(y) {
  cat(y)
  y <- '함수 내부에서 바깥 변수 변경 시도'
}
my.function('모수 y에 주어지는 값')
cat(y)
# 모수 이름도 y이고 함수 바깥에서 정의된 변수도 y이다. 그러나, 함수 정의에서
# 전달된 y라는 모수가 더 나중에 정의되었기 때문에 혼동이 생기지 않는다.
# 또한, 함수 내부에서 바깥 변수를 변경할 수 없다.

# 사실 함수와 모수, 변수, 이름에는 제한이 없다.
salute <-
  function(your.name = 'NONAME'){
    # parameter = argument 여기서 argument 값을 default 값이라 한다.
    message <- paste0('Hello, ', your.name, '!') # 함수 안에서도 변수를 지정 가능
    cat(message) # 아무 것도 안 함!
  } # 함수를 선언 => salute라는 변수에 저장 => salute라는 함수가 생성

rm(list = ls()) # 현재 작업 환경 내의 모든 변수 및 객체를 삭제하라는 명령
.foo <- function(x) {
  gvar <<- 'This is a global variable'
  lvar <- 'This is local variable'
} # 함수 이름 맨 앞에 .이 붙게 되면 함수가 숨겨진다. 보통 임시로 사용할 목적이나
# 자잘한 작업을 하여 함수의 이름을 정확하게 짓기 애매할 때 .temp 이런 식으로
# 사용할 수 있다.

.foo()
cat(lvar) # Error in cat(lvar) : object 'lvar' not found
cat(gvar)
# assignment operator의 차이에 주목하자. <- vs. <<-
# global variable(광역변수)는 함수 안에서 정의된 변수이면서 함께 작업 환경 내에도
# 접근, 변경이 가능한 변수이다. 주로 머리 함수에 공통적으로 쓰이는 변수를 
# 광역변수로 지정하게 한다.

salute() # Hello, NONAME!
# 기본적으로 함수를 실행하는 방법이다. 이를 function call(함수 콜)이라 한다.
salute(your.name = 'Minjeong Kim') # Hello, Minjeong Kim!
# 첫 번째 모수가 your.name이기 때문에 이 모수로 인자(argument)가 그대로 전달된다.
# your.name이라는 모수에 Minjeong Kim이라는 인자 입력

salute('Minjeong Kim') # Hello, Minjeong Kim!
# 첫 번째 모수가 your.name이기 때문에 이 모수로 인자(argument)가 그대로 전달된다.
# 이런 모수를 positional parameter라고 한다.

salute('Minjeong Kim', 22) # Error

my.sum <- function(vec, ...){
  return(sum(vec))
} # 임의의 개수의 모수로부터 인자들을 받아와 합한 값을 출력(return)함
# 주의: 이해를 돕기 위한 예제일 뿐 사실 전혀 쓸모 없는 함수임.
# ...은 입력될 모수의 개수가 정해져 있지 않다는 것을 의미하며, 동시에
# 함수에서 정의되지 않은 모수들과 인자들도 전달받을 수 있다는 것을 의미한다.

cat(my.sum(1:10))
# 55
cat(my.sum(1:10, 'random sentence'))
# 55
# 앞선 예제와 달리 오류가 아님

# 일차 방정식의 해를 구하는 함수
# y = ax + b의 해를 구해보자.
solve.linear.eq <- function(y, a, b){
  return((y-b) / a)
}
cat(solve.linear.eq(11, 2, 3))
# 7
cat(solve.linear.eq(11, 0, 1))
# Inf
# 일차 방정식에서 a가 0이고 y-b가 0이면, 0 = 0 * x; 해가 무수히 많다.
# y - b가 0이 아니면 해가 없다. 따라서 답이 Inf가 나오면 안 된다.

# 그렇가면 어떻게 이런 예외의 상황들을 컨트롤할 수 있을까?

# if-else 문 ----------------------------------------------------

# if-else 문은 주어진 조건에 따라 상황을 나누어 프로그램을 의도된 시나리오대로
# 진행되도록 설계할 수 있게 해주는 제어문이다. 만약 고려하는 상황이 3개 이상이라면,
# 다음과 같이 if-else를 사용할 수 있다. 

# 두 개의 상황
if(logical){ # 참, 거짓을 찬단할 수 있는 명제 e.g. x>0
  
}else{ # logical이 없음
  
}

# 세 개 이상
if(logical){
  
}else if(logical){
  
}else{
  
}

a <- 2

if (a >= 0){
  cat('a는 음수가 아니다.')
}else if (a >0){
  cat('a는 양수이다.')
}else(a < 0){ # a < 0
  cat('a는 음수이다.')
}

a <- factor(1) # factor와 double은 대소비교가 불가능

if (is.numeric(a) == F){ # 숫자형이 아니라면?
  cat('a는 숫자형이어야 합니다.')
}

solve.linear.eq <- function(y, a, b){
  if (a==0) {
    stop('1차 방정식이 아닙니다.')
    # 함수 혹은 제어문의 실행을 멈추고 오류를 출력하는 명령!
  }
}
cat(solve.linear.eq(11, 2, -3))
cat(solve.linear.eq(11, 0, -3))

# 함수의 정의에서 if-else 문은 return 함수를 활용할 때 유연하게 사용할 수 있다.

pos <- function(a){
  if (a >= 0){
    return('a는 음수가 아니다.') # 함수의 실행이 종료되는 지점
  }
  if (a > 0){
    return('a는 양수이다.')
  }
  return('a는 음수이다.')
}
pos(-1)
pos(0)
pos(1)
# return으로 값을 출력하는 순간 함수의 실행이 끝나게 된다.

# a >= 0 vs a > 0 => 겹치는 부분이 있음 (a > 0)
pos <- function(a){
  if (a == 0){
    return('a는 0이다.')
  }
  if (a > 0){
    return('a는 양수이다.')
  }
  return('a는 음수이다.')
}
# if의 조건문들이 서로 겹치지 않는 상황이 발생하지 않도록!
pos(-1)
pos(0)
pos(1)

# Loop ---------------------------------------------------------

# Loop문은 반복적인 계산을 여러 번에 걸쳐 수행해야 할 때 사용할 수 있는 제어문이다.

# for 문 ---------------------------------------------------

# 곱셈을 처음 배우는 사람에게 5 * 4를 어떻게 설명할 것인가? 바로 5라는 수를
# 4번 더하는 규칙이라고 가르칠 것이다. 이런 것이 바로  for의 개념이다.

char.vec <- c('1st', '2nd', '3rd', paste0(4:5, 'th'))
cat(char.vec[1])
cat(char.vec[2])
cat(char.vec[3])
cat(char.vec[4])
cat(char.vec[5])

for(i in char.vec){ #for문의 syntax: (iterator in iterable)
  cat(i, 'line\n') # 각 원소마다 오른쪽에 줄바꿈을 추가해 줌!
}

for(i in char.vec){ # c(1, 2, 3, 4, 5): iterator vector => char.vec의 주소값!
  cat(i, 'line\n') # 각 원소마다 오른쪽에 줄바꿈을 추가해 줌!
}

# 특정 범위 안에 있는 숫자 출력하기
num.vec <- rnorn(100)
for(i in num.vec) {
  if(i > 2 | i <- 2) cat('\n', i)
}

# 특정 문자열 출력하기
char.vec = c('I', 'l', 'o', 'v', 'e', 'y', 'o', 'u')
for(i in char.vec){
  if(char.vec[i] %in% c('l', 'o', 'v', 'e'))
    print(char.vec[i])
}

1:3 %in% 2:9
2:9 %in% 1:3
# 왼쪽 항을 오른쪽 항에서 검색 후 논리 벡터로!


# while문 --------------------------------------------------

# while문은 특정한 조건을 만족할 때까지 주어진 명령을 반복수행하는 제어문이다.
# 보통 지시를 반복할 횟수가 명확하지 않은 문제(예. 값 검색하기)를 해결할 때
# 사용하나, 그 쓰임새가 아주 다양하고 while로도 for제어문을 만들 수 있다.

len <- length(char.vec)
pointer <- 1
while (pointer <= len) { # pointer > len이면 while loop가 설치됨.
  cat(char.vec[pointer], '\n')
  pointer <- pointer + 1
}

pointer <- 1
set.seed(123) # 실험을 그대로 재현할 수 있게 해줌
random.vec <- runif(20, 3, 4) # 균등분포의 난수

# 난수로부터 0.1보다 작은 원소 검색하기(x < 0.1)
while (random.vec[pointer] >= 0.1) {#난수로부터 0.1보다 작은 원소 검색하기
  cat(random.vec[pointer], '>>')
  pointer <- pointer + 1
  if (pointer == length(random.vec)) cat('모든 원소가 0.1보다 크거나 같습니다.') break
}
cat(pointer, random.vec[pointer])

# Challenge: 재귀함수 --------------------------------------

# 재귀함수(recursive function)란 함수의 정의 안에서 함수 자기 자신을 다시 call하는
# 함수를 의미한다.
  
rec.fun <- function(x){
  # base(trivial) case => 함수의 실행을 종료하는 역할을 하게 됨.
  # do sth
}

# 팩토리얼 함수
# 팩토리얼 함수는 5! = 5*4*...*1처럼 주어진 숫자에 대해 1씩 줄여나가면서 곱하는 함수이다.

factorial <- function(n){
  prod(1:n) # numeric vector의 모든 원소를 곱하는 함수
}
factorial(3)

r.factorial <- function(n){
  cat('r.factorial called\n')
  if (n == 1) return(1) # base case
  ans <- n * r.factorial(n-1)
  return(ans) # recursive case
}
r.factorial(3)

library(imager) # 다음 시간에 소개!
plot(load.image('pics/r.fact.png'), axes = F)

# 소수 찾기 문제
# k보다 작은 소수를 모두 찾는 문제를 생각해보자. 2부터 k까지의 수 중
# 소수가 아닌 숫자를 모두 제거하면 남는 숫자가 소수일 것이다.
# 집합으로 따지자면 여집합의 개념일 것이다.

primes <- function(k){
  if(k==2) return(c(ans, 2) # base case
  for(i in 2:(k-1)){
    if(k %% i == 0) # recursive case
      return(prime(k - 1))
  }
  return(k)
}
print(le3)

# 자, k보다 작은 수 중 가장 큰 수를 찾는 것을 구현했다.
# 그러나 우리가 원하는 결과는 이러한 소수를 모두 찾는 것이다.
# 언제까지? 다장 작은 소수인 2에 도달할 때까지!

primes <- function(k, ans = c()){ # 재귀 과정에서 계속 아웃풋을 이어 받음
  if (k == 2) return(ans) # 2에 이르면 재귀 과정에서 모은 모든 소수들을 출력
  for(i in 2:(k-1)){
    if(k %% i == 0) # 인수가 있는 경우(소수가 아닌 경우)
      return(primes(k-1, ans)) # 소수가 아니면 결과물에 추가 안 함
  }
  return(primes(k-1), c(ans, k)) # 소수인 경우 결과물에 추가해죽 다음 재귀
}
primes(le3)

# !! IMPORTANT !!
# if-else 구문이라도 return의 성질을 이용하면
# if만으로도 의도한 로직을 구현할 수 있다.