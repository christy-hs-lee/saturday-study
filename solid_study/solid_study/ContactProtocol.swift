//
//  ContactProtocol.swift
//  solid_study
//
//  Created by 8기 불토 C반 on 2023/01/28.
//

protocol ContactProtocol {
    var addressList: [(String, String, String)] { get }
    
    func listUp()
    func userInput() -> [String]
    func checkAge(inputedAge: String) -> Bool
    func checkNumber(inputedNumber: String) -> Bool
}
