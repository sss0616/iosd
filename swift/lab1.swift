let firstName = "Symbat"
let lastName = "Orynbayeva"
let birthYear = 2006
let currentYear = 2025
let age = currentYear - birthYear
let isStudent = true
let height = 1.71 

let hobby = "dancing"
let numberOfHobbies = 3
let favouriteNumber = 8
let isHobby = true
let favouriteMeal = "lagman"

var student: String
if isStudent {
    student = "student"
} else {
    student = "not a student"
}

var hobbyT: String 
if isHobby {
    hobbyT = "creative"
} else {
    hobbyT = "not creative"
}

let lifeStory = "My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am currently \(student). I enjoy \(hobby), which is a \(hobbyT) hobby. I have \(numberOfHobbies) hobbies in total, and my favourite number is \(favouriteNumber). My height is \(height) meters. My favourite meal is \(favouriteMeal)"
print (lifeStory) 

let futureGoals = "In the future, i want to be someone who has seen the world🌍"
print(lifeStory + " " + futureGoals)