# by Minjeong Kim

# 자료의 유형을 배웠으니 이제 자료를 담을 수 있는 그릇, 자료구조에 대해 알아봅시다.

# vector / 벡터 -------------------------------------------------------------

# 벡터란 수학 혹은 물리학에서 방향과 힘을 나타내는 어려운 개념인데요,
# R에서 벡터란 가장 단순하면서 기본적인 1차원 자료구조입니다!
# 벡터는 c라는 함수를 이용하여 만들게 됩니다.
# c는 combine의 약자인데요, 주어진 자료를 벡터 혹은 리스트로 combine한다는
# 의미입니다. 리스트는 다음 절에서 얘기하겠습니다.

cat(c(1L, 2L, 3L))  # 1부터 3까지의 정수를 하나의 벡터로 표현하는 방법

# 서로 다른 유형의 숫자 및 논리유형을 묶게 되면?

cat(c(1L, 1.1, -1L, 22.1))  # 더블로 변환됨
cat(c(1L, T))  # 논리형이 정수로 변환됨
cat(c(1L, T, 0, 1.1))  # 모두 더블로 변환됨

# 문자열이 섞이게 되면 모두 문자형으로 변환된다.

cat(c(1.1, -2, 'abc'))

# 콜론 ":" 을 이용하면 두 숫자 사이의 수들을 1의 간격으로 자동 생성

cat(1:11)
cat(1.2:12.1)  # 12.1 제외됨
cat(-3:1.1)  # 1.1 제외됨

# seq 함수

# parameter = argument
cat(seq(1, 10))  # 1:10과 같음!
cat(seq(1, 2, by = .2))  # 1.0 1.2 1.4 1.6 1.8 2.0

# length 함수

cat(length(c(1, 2, 3)))

# 벡터 다루기 ------------------------------------------------------------------

# 벡터의 인덱싱(indexing)과 편집

(my.vec <- c(1L, 2.1, T, 'R is fun'))
my.vec[3]  # 3번째 원소만 추출하기
typeof(my.vec[3])  # 문자열로 통일됨
my.vec[4] <- 'R is fun and useful as well!'
# 4번째 원소를 하나의 변수로 취급하여 새로운 값을 입력 => 편집의 원리

my.vec[1:2]  # subsetting
my.vec[-4]  # 4번째 원소만 제외하기
my.vec[-c(1, 4)]  # negative subsetting
my.vec[c(F, T, T, F)]  # logical indexing이라 한다.

my.vec[my.vec == '1']  # 비교연산을 활용한 인덱싱

my.vec[c(1, 3, 4)] <- c(T, 0, 'yes~!')  # subset을 이용한 동시편집
# 위와 같은 편집은 특히 행렬구조의 자료구조에서 많이 사용된다.

# 벡터의 추가 연산들

cat(x1 <- 1:5)
# 1 2 3 4 5
cat(x2 <- (-1) ^ (1:5))  # -1, 1이 반복되는 수열을 만드는 법
# -1 1 -1 1 -1

# 원소별 사칙연산 (elementwise operations)
x1 + x2
x1 - x2
x1 * x2
x1 / x2

x3 <- 1:2
x1 + x3
# [1] 2 4 4 6 6
# Warning message:
#   In x1 + x3 :
#   longer object length is not a multiple of shorter object length

names(x1)  # NULL
names(x1) <- paste0('x', 5:1)  # 벡터 원소에 이름 붙여주기
x1

# list / 리스트 --------------------------------------------------------------

# 리스트는 벡터와 비슷하지만 전혀 다른 점이 있습니다.
# 바로 서로 다른 유형의 자료를 담을 수 있다는 건데요, 벡터는 앞에서 보셨듯
# 단일 자료유형으로 입력하거나, 여러 유형의 자료가 입력될 경우 자동으로 자료유형을
# 단일화 하는데요. 리스트는 여러 유형의 자료를 하나의 리스트로 담을 수 있다는
# 특징이 있습니다. 담을 수 있는 자료의 유형도 전혀 제한이 없어요!

# list에는 cat를 적용할 수 없다.
list('a', 'b', 'c', 'd')  # 이름이 없는 원소(element)들
list(
  'a' = 1L, # integer
  'b' = 'bb', # character
  '1.2' = 3, # double
  'd' = T  # logical
)  # 이름이 있는 원소들: 이름은 보통 문자열로 지정함
list('a' = c('a1', 'a2', 'a3'),
     'x' = c(1, 2))  # 서로 다른 구조 및 크기의 자료로도 구성 가능함

# 리스트 다루기 -----------------------------------------------------------------

# 리스트의 인덱싱과 편집

my.list <-
  list(mat = matrix(1:4, nrow = 2),
       vec = c('a', 'b', 'c'),
       list(a1 = 1, a2 = 2))
str(my.list)  # str 함수

my.list[1]  # list of first element
my.list['mat']  # for named element
my.list[[1]]  # first element
my.list[[2]]  # second element

my.list[2]
my.list[c('vec', 'mat')]  # list of element
my.list[['vec']]  # element itself
my.list[[c('vec', 'mat')]]  # Error

(my.list[[2]] <- rev(my.list[[2]]))  # rev 함수
my.list

my.list[3]
my.list[[3]]
my.list[3][[1]]$a1
my.list[[3]]$a1

# matrix / 행렬 -------------------------------------------------------------

# 행렬은 이름에서 알 수 있듯 행과 열, 두개의 차원이 존재하는 자료구조입니다.
# matrix라는 함수를 이용해 생성합니다. 행렬을 만들때는 총 세개의 변수값이 주어져야 합니다.
# 바로 nrow, ncol, byrow(행 개수, 열 개수, 행방향 입력 여부(논리형))입니다.
# dimnames 변수를 이용하면 행 및 열에 이름을 부여할 수 있습니다.

matrix(c(1, 2, 3, 4),
       nrow = 2,
       ncol = 6,
       byrow = T)  # 길이 4인 벡터를 2행 2열의 행렬로 만듦(원소를 행방향으로 입력)
matrix(c(-1, 1, -2, 2), nrow = 2, dimnames = list(c('row1', 'row2'), c('col1', 'col2')))
# 행 및 열에 이름 부여

# 서로 다른 유형의 자료가 있다면 벡터와 마찬가지로 자료 유형이 하나로 통일됩니다.

# data type overiding / coercing
matrix(c(1, 'a', 2, 'b'), nrow = 2, byrow = T)  # 문자열로 통일
matrix(c(T, 'a', F, 'b'), nrow = 2, byrow = T)  # 문자열로 통일
matrix(c(1, T, 2.1, 1L), nrow = 2, byrow = T)  # 더블로 통일
matrix(c(T, F, 1L, 0L), nrow = 2, byrow = T)  # 정수로 통일


# array / 배열 --------------------------------------------------------------

# 배열은 행렬의 확장입니다. 행렬은 행과 열 두개의 차원만 가지지만,
# 배열은 여러개의 차원을 가질 수 있다는 차이가 있습니다.
# 배열도 행렬처럼 dimnames를 지정해줄 수 있고, dim으로 차원을 지정할 수 있습니다.

array(1:24, dim = c(4, 2, 3),
      dimnames = list(c('row1', 'row2', 'row3', 'row4'), c('col1', 'col2'), c(3:1)))
# 자료가 기본적으로 열방향으로 입력됨
array(c('a', 'b', 'c', 'd', 'e', 'f'), dim = c(2, 3))  # 행렬과 같아짐
array(c(1L, 2,-3.0, 'a', 'b', 'c'), dim = c(2, 3))  # 벡터처럼 자료유형이 하나로 통일됨
array(c(1L,-2L, 3.1), c(1, 3, 1))  # 마찬가지

# 배열은 여러개의 차원을 가질 수 있는 만큼, 사용자는 차원을 자유롭게 늘릴 수 있어요.
# 차원의 총 주소 개수와 데이터의 길이가 맞지 않으면 기존 값을 반복하면서 입력합니다.

array(c(1L, 2L), c(2, 1, 3))  # 입력자료의 길이는 2, 차원의 주소는 총 6개

# 단일 자료 유형으로만 구성할 수 있다는 점을 명심해야 합니다.


# data.frame / 데이터프레임 ----------------------------------------------------

# 데이터프레임은 아마 여러분도 가장 익숙한 형태의 자료구조일 것입니다.
# 엑셀 혹은 스프레드시트의 모습을 떠올려보세요. 데이터프레임과 똑같습니다!
# 혹시 데이터베이스에 대해 알고계시다면 데이터프레임은 테이블과 같은 구조라고
# 이해하실 수도 있구요.

# 데이터프레임의 기본적인 형태는 행렬과 비슷하지만,
# 서로 다른 유형의 열들을 한 테이블로 묶을 수 있다는 차이점이 있죠.
# data.frame 이라는 함수를 이용하여 만들 수 있고, 행 및 열 이름도 지정 가능합니다.

data.frame(1:4, row.names = 4:1)  # 행 이름을 numeric으로 지정 가능
data.frame(1:4, row.names = letters[1:4])  # 문자열 행 이름

# 데이터프레임은 행렬과 다르게 열 이름을 자동적으로 지정해준다는 특징이 있습니다.
# 데이터프레임에는 반드시 서로 다른 열 이름이 지정되어 서로 다른 열이 구분될 수
# 있어야 합니다. 이는 열 이름으로 해당 열의 자료를 조회, 수정, 추가, 삭제가
# 가능하다는 뜻이기도 합니다.

data.frame(matrix(1:4, nrow = 2))  # 열이름이 자동으로 지정됨

# 행렬 -> 데이터프레임, 데이터프레임 -> 행렬 모두 가능합니다.

data.frame('열1' = 1:2, '열2' = 2:1)  # 열이름을 직접 지정하여 생성하기
data.frame('열1' = 1,
           '열2' = 1:2,
           '열3' = 1:3)  # Error: 열들의 길이가 같지 않으므로 오류!!

# 리스트는 서로 다른 크기의 자료들을 묶을 수 있었다.
# 그러나 데이터프레임은 각 열별로 자료의 개수가 모두 같아야 함!


# 데이터 프레임 다루기 -------------------------------------------------------------

# data.frame[i, j]
# i는 행, j는 열의 index이다.

data(USArrests)
# R에 기본적으로 내장된 데이터. 1973년 미국 주별 범죄 유형별 체포건수 자료.
# 각 행 이름은 주 이름이 입력되어 있고, 10만명 당 살인, 폭행, 강간사건 체포건수와
# 도시인구 비율이 각 열에 입력되어 있다.
USArrests[50, ]  # 특정행 고르기
USArrests[50, 1]
USArrests[50, 1:2]
USArrests[48:50, ]
USArrests$Rape  # 특정열 고르기
USArrests[, 4]

# 고급: 복합조건 검색방법
# with 함수는 named element를 번거로운 indexing 작업 없이 사용할 수 있게 해준다.
USArrests[USArrests$Murder > 12 & USArrests$Rape > 30,]  # 살인이 12, 강간이 30 이상
with(USArrests, Murder > 12 & Rape > 30)  # 복합조건 로직벡터
with(USArrests, USArrests[Murder > 12 & Rape > 30,])  # 깔끔함!

USArrests[USArrests$Murder > 12 & USArrests$Rape > 30,] <- 
  USArrests[c('Minnesota', 'New York', 'Kansas'),]  # re-assignment
USArrests[c('Florida', 'Michigan', 'Nevada'),]  # 값이 업데이트 됨! 그러나 행이름은 보존됨!