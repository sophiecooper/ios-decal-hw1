//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.




//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?


//: The init function takes two optional String values, as denoted by "String?", while the instance variables take unwrapped Strings, as denoted by "String!". These do not take the same type, as one is an optional, to ensure that the code will still run if the init function is called without strings.


//: ## Q2: Variable Types and Function Types
    class func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reverse())}
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
//: ### Why does the compiler dislike the **for loop**? Fix it.
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: The for loop originally used a constant variable to iterate through the elements. However, with a for loop, the value of i changes with each iteration, which goes against the rules of a constant. So I changed the "let" to a "var" to solve this problem. I also added a "return true" statement at the bottom to ensure that the function returns a boolean (which this function requires).

//: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters = [Character : Int]() //Line X
        let lenA = self.wordA.characters.count
        let lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: In Line X, the dictionary is being declared but not initialized, which is why it causes an error in Line Y. I solved this problem by adding the parenthesis to initialize the dictionary on Line X. The other problem was that the function was created as a class function, which caused problems when using the self keyword to access instance variables. I solved this by making it a regular function rather than a class function. 
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
print("---OUTPUT---")
print(Words.arePalindromes(["hih", "racecar", "mom", "wow"]))
print(Words.arePalindromes(["gene", "shawn", "hello"]))
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
print(wordsObj.isAnagram())
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
print(wordsObj.isAnagram())
