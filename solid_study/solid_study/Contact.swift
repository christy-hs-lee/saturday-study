//
//  Contact.swift
//  solid_study
//
//  Created by 8기 불토 C반 on 2023/01/28.
//

import Foundation

class Contact: ContactProtocol {
    var addressList = [(String, String, String)]()
    
    func listUp() {
        while true {
            let infoArray: [String] = userInput()
            let name = infoArray[0]
            let age = infoArray[1]
            let phoneNumber = infoArray[2]
            
            if checkAge(inputedAge: infoArray[1]) == false {
                print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
                continue
            } else if checkNumber(inputedNumber: infoArray[2]) == false {
                print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
                continue
            }
            print("입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다.")
            addressList.append((name, age, phoneNumber))
            break
        }
    }

    func userInput() -> [String] {
        var inputArray = [String]()
        
        print("연락처 정보를 입력해주세요 : ", terminator: " ")
        
        if let input = readLine() {
            inputArray = input.components(separatedBy: " ").joined().components(separatedBy: "/")
        }
        
        while true {
            if inputArray.count == 3 {
                break
            } else {
                if let input = readLine() {
                    inputArray = input.components(separatedBy: "/")
                }
            }
        }
        return inputArray
    }

    func checkAge(inputedAge: String) -> Bool {
        guard let convertedNum = Int(inputedAge) else {
            return false
        }

        if convertedNum >= 0 && convertedNum < 999 {
            return true
        } else {
            return false
        }
    }

    func checkNumber(inputedNumber: String) -> Bool {
        if inputedNumber.components(separatedBy: "-").count != 3 || inputedNumber.count < 11 {
            return false
        } else if inputedNumber.first != "-" && inputedNumber.last != "-" {
            return true
        } else {
            return false
        }
    }
}

