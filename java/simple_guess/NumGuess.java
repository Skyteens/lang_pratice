import java.util.Random;
import java.util.Scanner;  
  
public class NumGuess {

    static boolean compareVals(int guess, int answer) {  
        System.out.println("You guessed: " + guess);  
  
        if (guess == answer) {  
            System.out.println("Congrats, Your answer is Correct!");  
            return true;  
        } else {  
            if (guess > answer) {  
                System.out.println("Guess too big!");  
            } else {  
                System.out.println("Guess too small!");  
            }  
            return false;  
        }  
    } 

    public static void main(String[] args) {  
        System.out.println("Guess the number!");  
  
        int maxTries = 3;
        int counter = maxTries;  
        Random rand = new Random();  
        int answer = rand.nextInt(10);  
  
        Scanner scanner = new Scanner(System.in);  
  
        while (true) {  
            if (counter == 0) {  
                System.out.println("Sorry, you have reached the maximum tries of " + maxTries + " times.");  
                return;  
            }  
  
            System.out.print("Please enter your guess.(below 10): ");  
            String guess = scanner.next();  
  
            try {  
                int guessInt = Integer.parseInt(guess);  
  
                if (guessInt < 11) {  
                    // System.out.println("You entered: " + guess + ", the correct is " + answer); 
                    if (compareVals(guessInt, answer)) {  
                        scanner.close();
                        return;  
                    }  
                } else {  
                    System.out.println("Please enter a number below 10!");  
                    counter--;  
                }  
            } catch (NumberFormatException e) {  
                System.err.println("Please type a valid integer!");  
                counter--;  
            }  
        }  

    }  
}  

