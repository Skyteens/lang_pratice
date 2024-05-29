#include <iostream>  
// #include <string>  
// #include <cstdlib>  
#include <ctime>  
using namespace std;  
  
  
static int compare_vals(int* guess, int* answer){


    cout << "You entered: " << *guess << endl;
    // << " the correct is: " << *answer 

    if (*guess == *answer) {
        cout << "Well done, you guessed correctly!" << endl;
        return true;
    } else {

        if (*guess > *answer){
            cout << "Guess is too big!" << endl;
        } else {
            cout << "Guess is too small!" << endl;
        }

        return false;

    }

}

int main(){  
    cout << "Guess the number!" << endl;  


    int max_tries = 3;
    srand(time(0));
    int answer = rand() % 10;    
    
    while (true) {  
         
        if (max_tries == 0) {  
            std::cout << "Sorry, you have reached the maximum tries of 3 times." << std::endl;  
            return 0;  
        } 
        

        cout << "Please enter your guess. (below 10): ";  
  
        string guess;    
        cin >> guess;

        try {
            int guessInt = stoi(guess);
            
            if (guessInt < 11) {
                if (compare_vals(&guessInt,&answer)){
                    return 0;
                } 

            } else {
                    cout << "Please enter value below 10" << endl;
                    max_tries--; 
            }

            

        } catch(const invalid_argument& ia) {
            cerr << "Please enter a valid integer! " << endl;
            max_tries--; 
        }
    };


  
    return 0;    
}  