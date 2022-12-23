import Foundation
 
//guard assert
func Function(info:[String:Any]){
    
    guard let name = info["name"] as? String else{
        print("no name")
        return
    }
    
    guard let age = info["age"] as? Int,
          age >= 0 else{
        print("no age")
        return
    }
    print("\(name):\(age)")
}

Function(info: ["name":"jaeyong","age":23])
Function(info: ["name":"jaeyong"])
Function(info: ["age":23])
