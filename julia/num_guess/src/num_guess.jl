using Random  
  
function guessNum()
    println("Guess the number!")  

    max_tries =3 
    answer = rand(1:10) 
    while true

        if max_tries == 0 
            println("Sorry, you have reached max tries of 3 times.")
            return
        end

        print("Please enter a number (below 10): ")    
        guess = readline() 
        guessInt = tryparse(Int, guess) 

        if isnothing(guessInt)  
            println("Please enter a valid integer")
            max_tries -=1 
        else   

            if guessInt > 10  
                println("Please enter a number below 10!")
                max_tries -=1
            else  
                if _compare_vals(guessInt,answer)  
                    return    
                end
            end 

        end  

    end

end  


function _compare_vals(guess,answer)  
   
    println("You guessed: ", guess)  
    # println("Correct number is: ", correct) 
    # println("You guessed: $(guess)!, correct is: $correct.")  
    
    if answer == guess 
        println("Congrats, you guessed corectly")
        return true
    else
        # println("Sorry, you are wrong!") 
        if guess > answer 
            println("Guess too big!")
        else
            println("Guess too small")
        end
        return false
    end
end 
  



guessNum()