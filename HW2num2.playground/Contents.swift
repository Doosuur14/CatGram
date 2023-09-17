import UIKit

///finding the first even number from an array of number using first.
var arrayOfNumbers = [1,2,3,4,5,6,7,8,9]
func evenNumberCheck(_ input: [Int]) {
    let evenNumber = arrayOfNumbers.first{ $0 % 2 == 0}
}
evenNumberCheck(arrayOfNumbers)

///findiing the word to start with a certain letter using first.
var arrayOfWords = ["java","love","okay","beauty"]
func firstWordCheck(_ input: [String], _ letter: Character) {
    input.first { $0.hasPrefix(String(letter))}
}
let alphabet: Character = "l"
firstWordCheck(arrayOfWords, alphabet)

