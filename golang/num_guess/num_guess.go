package main

import (
	"fmt";
	"strconv";
	"math/rand" )

func main() {
    fmt.Println("Guess a number!")

	var guess string
	max_tries :=3
	answer := rand.Intn(11)  

	for {
		if max_tries == 0{
			fmt.Println("You have reached max tries of 3 times")
			return
		}

		fmt.Print("Please enter an integer. (below 10): ")  
		fmt.Scanln(&guess)
		
	
		guessInt, err := strconv.Atoi(guess)  
		if err != nil {  
			fmt.Println("Please enter a valid integer")
			max_tries -=1 
		} else if guessInt > 11 {
			fmt.Println("Please enter a number below 10")
			max_tries -=1
		} else {
			if _compare_val(&guessInt,&answer) {
				return;
			}
			
		}
	}

}

func _compare_val(guess *int,answer *int) bool {


	// fmt.Println("Correct number is:", answer)  
	fmt.Println("You guessed: ",*guess)
	// fmt.Printf("You guessed: %s,Correct answer is: %s. ", guess, answer)  
	
	if *guess == *answer {
		fmt.Println("Congrats, You are correct!")
		return true
	} else {
		// fmt.Println("Sorry you are wrong.")
		if *guess > *answer {
			fmt.Println("Guess too big!")
		} else {
			fmt.Println("Guess too small!")
		}
		return false
	}
	return false
}