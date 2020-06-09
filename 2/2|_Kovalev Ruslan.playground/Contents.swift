import UIKit

//Задание 1

func filterEven (num: Int) -> Bool {
    let answer = num % 2 == 0 ? true : false
    return answer
}

let result = filterEven(num: 2)
print (result)
print ("\n--------------------------\n")


// Задание 2

func DivThree (num: Int) -> Bool {
    let answer = num % 3 == 00 ? true : false
    return answer
}

let result2 = DivThree(num: 4)
print (result2)
print ("\n--------------------------\n")


//Задание 3

func massiveEncrease (num: Int, massiveCount: Int) -> [Int] {
    var arr: [Int] = []
    for i  in 0..<massiveCount {
        arr.append(num + i)
    }
    return arr
}

let result3 = massiveEncrease(num: 0, massiveCount: 100)
print (result3)
print ("\n--------------------------\n")

//Задание 3

var arr: [Int] = massiveEncrease(num: 0, massiveCount: 100)
for index in stride(from: arr.count - 1, through: 0, by: -1) {
    if !DivThree(num: arr[index]) || filterEven(num: arr[index]) {
        arr.remove(at: index)
    }
}

let result4 = arr
print (result4)
