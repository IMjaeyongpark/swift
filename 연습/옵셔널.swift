//
//  Practice.swift
//  test
//
//  Created by 박재용 on 2022/12/23.
//

import Foundation

//옵셔널 ?!
//init deinit
class  Test{
    
    var name : String
    var age : Int
    var zz : String?
    
    convenience init(name: String, age: Int, zz: String) {
        self.init(name: name, age: age)
        self.zz = zz
    }
    
    init(name:String,age:Int){
        print("생성")
        self.name = name
        self.age = age
    }
    
    deinit{
        print("해제")
    }
}

var test : Test? = Test(name: "jaeyong",age: 23)

if let t = test{
    print(t.name)
    if let a = t.zz {
        print(a)
    }
}
  
print(test2?.zz ?? "no")
 
var test2 : Test? = Test(name: "jaeyong",age: 23,zz: "hi")

let a = test2

if let a = test2?.zz{
    print(a)
}

/*
 if let t = test2{
    if let a = t.zz{
        print(a)
    }
 }
 */

test2 = nil
