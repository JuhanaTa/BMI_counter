//
//  Person.swift
//  BMI_calculator
//
//  Created by iosdev on 5.11.2020.
//  Copyright © 2020 iosdev. All rights reserved.
//

import Foundation

class Person {
    
    let minAge = 0
    let maxAge = 110
    let minHeight: Double = 100
    let maxHeight: Double = 240
    let minWeight: Double = 30
    let maxWeight: Double = 200
    
    private(set) var height: Double
    private(set) var weight: Double
    private(set) var age: Int
    private(set) var profession: [String] = []
    private(set) var name: String
    
    init?(name: String, age: Int, height: Double, weight: Double, profession: [String]) {
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.profession = profession
    }
    
    func addAge (newAge: Int){
        if (newAge >= minAge && newAge <= maxAge){
            self.age += newAge
        } else {
            print("not suitable age")
        }
        
    }
    
    func changeHeight (newHeight: Double){
        if(newHeight >= minHeight && newHeight <= maxHeight){
            self.height = newHeight
        } else {
            print("not suitable height")
        }
    }
    
    func changeWeight (newWeight: Double){
        if(newWeight >= minWeight && newWeight <= maxWeight){
            self.weight = newWeight
        } else {
            print("not suitable weight")
        }
    }
    
    func addProfession (newProfession: String){
        if (profession.count < 5) {
            if (profession.contains(newProfession)) {
                print("that profession already exists")
            } else {
                profession.append(newProfession)
            }
            
        } else {
            print("cant add more than 5 professions")
        }
        
    }
    
    func deleteProfessions (){
            profession = []
    }
    func getPersonData () -> (name: String, age:Int, height: Double, weight: Double, profession: [String]){
        return (name, age, height, weight, profession)
    }
    

    
    func calculateOnlyBmi() -> Double{
        let bmi = weight / (height * height) * 10000
        return bmi
    }
    
}

/*var Person1 = Person(age: 12, height: 180, weight: 85, profession: ["baker"])
var data = Person1.getPersonData()
print("\(data)")

Person1.addAge(newAge: 15)
Person1.changeHeight(newHeight: 165)
Person1.changeWeight(newWeight: 100)
Person1.addProfession(newProfession: "teacher")
Person1.addProfession(newProfession: "tester")
Person1.addProfession(newProfession: "coder")
Person1.addProfession(newProfession: "teacher")

data = Person1.getPersonData()
print("\(data)")

Person1.deleteProfessions()
data = Person1.getPersonData()
print("\(data)")*/

