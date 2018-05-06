
protocol Familiable {
    associatedtype FamilyType = Int
    func getName() -> [FamilyType]
}

class NumberFamily1: Familiable {
    func getName() -> [Int] {
        return [1,2,3]
    }
}
/*
 or do  like this
 class NumberFamily: Familiable {
 func getName() -> [FamilyType] {
 return [1, 2, 3]
 }
 }
 */
let numberFam = NumberFamily1() // NumberFamily<Int>
print(numberFam.getName())


struct NormalFamily < T : ExpressibleByStringLiteral > : Familiable {
    func getName() -> [T] {
        return ["Bob", "Bobby", "Lee"]
    }
}

let nf = NormalFamily<String>()
print(nf.getName())

//----------------------------------------------------------------------------------------------------//

protocol GenericProtocol {
  
    associatedtype myType
    
    var anyProperty : myType {get set}
}


class SomeClass : GenericProtocol {
    typealias myType = String
    var anyProperty: String = "Bob"
    
}

struct SomeStruct  : GenericProtocol {
    typealias myType = Int
    var anyProperty: Int = 100
}


extension  GenericProtocol  {
     func introduce() {
        print("introduce from Normal -->  First extension")
    }
}

extension GenericProtocol  where myType == String {
    func introduce(){
        print("introduce from   -->  where myType == String ")
    }
}

let sc = SomeClass()
sc.introduce()
sc.introduce()

let ss  = SomeStruct()
ss.introduce() // it will call first implementation



 extension GenericProtocol where myType == String , Self == SomeClass {
    func introduce(){
        print("introduce from   -->  where myType == String and  Self == SomeClass")
    }
}

sc.introduce()
sc.introduce()
sc.introduce()




























