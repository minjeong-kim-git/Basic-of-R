# 자, 지금부터는 우리가 간단한 hangman game을 만든다고 생각하고
# 중요한 제어문(control statement)의 개념들을 하나씩 익혀나가 보자.
# 행맨게임은 주어진 문제에 대해 영어 알파벳을 하나씩 추측해가며
# 정답을 맞추는 게임이다. 오답을 6번을 넘기지 않으면서 정답을 맞춰
# 캐릭터를 구해야 한다.

# 게임을 만들땐 우선 사용자 상호작용(interaction)를 고려해야 한다.
# 이는 사용자와 프로그램의 상호작용 방법을 디자인하는 단계이다.
# 다음 조건들을 생각해보자.
#   1. 7번 틀리면 플에이어의 패배, 그 전에 정답을 맞추면 승리!
#   2. 추측은 오직 영어 알파벳으로만!!
#   3. 한번 틀린 알파벳은 다시 사용하지 않도록 해주자!

# variable dictionary (변수 사전)

# number.mistakes:  누적 실수 횟수
# player:           플레이어의 답안지  # e.g. _ _ a _ _ _
# hangman.word:     정답 단어
# letter:           사용자가 추측한 알파벳
# used.letters:     이미 사용된 알파벳

# readline 함수
user.input <- readline('아무 알파벳이나 입력하세요: ')


play.hangman <- function() {
  # 변수 사전을 먼저 정의해 보세요.
  number.mistakes <- 0 # 틀린 횟수
  hangman.word <- "korea"
  splt.word <- strsplit(hangman.word, '')[[1]]
  used.letters <- c()
  n <- str_length(hangman.word) #stringr 패키지에 있는 함수
  player <- rep('_', n)
  
  # 먼저, 단어를 추측할 때마다 number.mistakes를 확인해줘야 할 겁니다.
  # 그리고 사용자의 편의를 위해 player를 먼저 출력해주고, 알파벳을 추측하도록
  # 유도해 보세요. 이미 사용했던 알파벳을 말한다면 이를 알려주고 지금까지 사용한
  # 알파벳을 출력해 보세요.
  
 while (number.mistakes <= 6)  { # 1. 실수가 6번까지 허용됩니다. 어떤 제어문을 사용해야 할까요?
    cat(player, sep = '')  # 2. 먼저 답안지를 출력해 주세요.
    letter <- readline("영어 알파벳으로 추측해보세요.")  # 3. 사용자가 추측하도록 유도하는 메시지를 작성해 보세요.
    while(toupper(letter) %in% LETTERS){
      letter <- readline("영어 알파벳으로 추측해보세요.: ") # 자료 유형에 오류가 있을 때
    }
    while(toupper(letter) %in% used.letters) {  # 4. 이미 사용했던 알파벳이라면? 어떤 제어문을 사용할까요?
      guess.messages <- cat(paste("이미 사용된 알파벳입니다.", touper(used.letters)))  # 5. 사용자에게 알려주세요!
      letter <- readline(paste(guess.messages, '다른 알파벳으로 추측해보세요: '))
    }
    
    # 1. 'a'를 korea라는 문자열에서 검색
    # 2. a를 c('k', 'o', 'r', 'e', 'a')라는 문자열 벡터에서 검색
  
    if(letter %in% split.word) {  # 6. 알파벳이 답이라면? 어떤 제어문을 쓸까요?
      logic.v <- split.word == letter # logical vector
      player[logical.v] <- letter
      word.display <- paste(player, sep = "")  # 7. 맞춘 자리에 알파벳을 채워서 답안지를 보여줘야겠죠!
    } else { # 8. 추측이 틀렸어요. 이때,
      number.mistakes <- number.mistakes + 1
      # 9. 플레이어에게 틀렸음을 알려주고 몇번의 기회가 남았는지 알려주세요!
      cat('오답입니다.', paste0(7 - number.mistakes, "번의 기회가 남았습니다."))
      # 10. 그리고 실수횟수 세는것도 잊지 말아야겠죠?
    }
    used.letters <-c(used.letters, toupper(letter))  # 11. 지금까지 사용된 알파벳의 정보를 저장해야겠죠?
    }
    if(!'_' %in% player) {
      cat('승리!')
      break
    }
    if(number.mistakes >= 7)  { # 12. 실수가 7번이 되면 어떤 메시지를 출력할까요?
      guess.messages <- "졌습니다. 다시 플레이하시겠어요?"
      cat(guess.messages)
      break
    }
}

play.hangman()
