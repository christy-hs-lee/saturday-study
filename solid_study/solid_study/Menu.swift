//
//  Menu.swift
//  solid_study
//
//  Created by 8기 불토 C반 on 2023/01/28.
//

class Menu {
    let contactList: ContactProtocol
    
    init(contactList: ContactProtocol) {
        self.contactList = contactList
    }
    
    func selectMenu() {
        while true {
            print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
            print("메뉴를 선택해주세요 : ", terminator: " ")
            
            guard let userSelect = readLine() else {
                print("다시 입력해주세요.")
                continue
            }
            
            switch userSelect {
            case "1" :
                contactList.listUp()
            case "2" :
                addressView()
            case "3" :
                addressSearch()
            case "x" :
                print("[프로그램 종료]")
                return
            default :
                print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.")
                continue
            }
        }
    }
    
    func addressView() {
        for tuple in contactList.addressList.sorted(by: >){
            print("-", tuple.0, "/", tuple.1, "/", tuple.2)
        }
    }
    
    func addressSearch() {
        print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: " ")
        guard let searchName = readLine() else {
            return
        }
        for tuple in contactList.addressList {
            if searchName == tuple.0 {
                print("-", tuple.0, "/", tuple.1, "/", tuple.2)
                continue
            } else {
                print("연락처에 \(searchName) 이(가) 없습니다.")
                break
            }
        }
    }
}
