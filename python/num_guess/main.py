import random as rand

def guess_num():
    print("Guess a number" )
    max_tries = 3
    answer = rand.randint(1,10)

    while True:
        if max_tries == 0:
            print("Sorry you have reach max tries of 3 times!")
            return 

        guess = input("Please enter your guess.(below 10): ")

        if not guess.isdigit():  
            print("Please type a valid integer!")  
            max_tries -=1
        else:  
            guessInt = int(guess)
            if guessInt > 11:
                print("Please enter a number below 10!")
                max_tries -=1
            else:
                if compare_vals(guessInt,answer): return 

def compare_vals(guess,answer):


    # print(f"The correct number is {correct}")
    print(f"You guessed: {guess}")
    # print(f"Your guessed: {guess}, The correct is: {answer}")

    if guess == answer:
        print("Congrats, Your answer is Correct!")
        return True
    else:
        # print("Sorry, you guessed wrong.")
        if guess > answer:
            print("Guess too big!")
        else :
            print("Guess too small!")
        return False

if __name__ == "__main__":
    guess_num()
