// Open closed principle (OCP)
// one should be able to extend a class behaviour without modofiying it
// Any class followong OCP should fulfill two citteria
// 1) Open for extension. This nesures that the class behaviour can be extended In real world scenario requirements keep changing
// 2) Closed for modification

// Example
// 
import Foundation
import UIKit

// Now lets add OCP
// Protocol Condition basically checks if a particular item satissfies some criteria
// Funciton isConditionMet takes item of generic type T and returns bollean
protocol Condition {
    associatedtype T
    func isConditionMet(_ item: T) -> Bool
}

// Protocol named filter has function called filter which takes an array of itens
// of generic type T and condition of type Condition as parameters and returns the filtered arraty
protocol Filter {
    associatedtype T
    func filter<Cond: Condition>(_ items: [T], _ cond: Cond) -> [T] where Cond.T == T
}

class RoleCondition: Condition {
    typealias T = Cricketer
    let role: Role
    init(_ role: Role) {
        self.role = role
    }
    
    func isConditionMet(_ item: Cricketer) -> Bool {
        return item.role == role
    }
}

class TeamCondition: Condition
{
    typealias T = Cricketer
    let team: Team
    init(_ team: Team) {
        self.team = team
    }
    
    func isConditionMet(_ item: Cricketer) -> Bool {
        return item.team == team
    }
}

class OCPCricketFilter {
    typealias T = Cricketer
    
    func filter<Cond: Condition>(_ items: [Cricketer], _ cond: Cond) -> [T] where Cond.T == T {
        var filteredItems = [Cricketer]()
        
        for item in items {
            if cond.isConditionMet(item){
                filteredItems.append(item)
            }
        }
        
        return filteredItems
    }
}

enum Team {
    case Australia
    case India
    case Croatia
    case USA
}

enum Role {
    case batsman
    case bowler
    case allrounder
}

class Cricketer {
    var name: String? = ""
    var team: Team
    var role: Role
    init(_ name: String, _ team: Team, _ role: Role) {
        self.name = name
        self.team = team
        self.role = role
    }
}

class CricketerFilter {
    func filterByTeam(_ criketers: [Cricketer], _ team: Team) -> [Cricketer] {
        var filteredResult = [Cricketer]()
        
        for item in criketers {
            if item.team == team{
                filteredResult.append(item)
            }
        }
        return filteredResult
    }
    
    // Part 2, now we can add more method
    
    func filterByRole(_ cricketers:[Cricketer], _ role: Role) -> [Cricketer] {
        var filteredResult = [Cricketer]()
        
        for item in cricketers {
            if item.role == role {
                filteredResult.append(item)
            }
        }
        
        return filteredResult
    }
    
    func filterByRoleAndTeam(_ cricketers: [Cricketer], _ role: Role, _ team: Team) -> [Cricketer] {
        var filteredResult = [Cricketer]()
        
        for item in cricketers {
            if item.role == role && item.team == team {
                filteredResult.append(item)
            }
        }
        
        return filteredResult
    }
}

// This example is not good and shows how to not create OCP
func main(){
    let sinisa = Cricketer("Sinisa", .Croatia, .allrounder)
    let jordan = Cricketer("Jordan", .USA, .batsman)
    let mihael = Cricketer("Mihael", .India, .batsman)
    let drazen = Cricketer("Drazen", .Australia, .bowler)
    let pero = Cricketer("Pero", .Australia, .batsman)
    let tonci = Cricketer("Antonio", .Croatia, .batsman)
    let luka = Cricketer("Luka", .India, .allrounder)
    
    let cricketers = [sinisa, jordan, mihael, drazen, pero, tonci, luka]
    
    print("Croatia Cricketers")
    let cricketerFilter = CricketerFilter()
    
    for item in cricketerFilter.filterByTeam(cricketers, .USA) {
        print("\(item.name) belongs to USA team")
    }
    
    for item in cricketerFilter.filterByRoleAndTeam(cricketers, .batsman, .Croatia) {
        print("\(item.name) belongs \(item.team) Team")
    }
}

// Good OCP example
func main_new(){
    let sinisa = Cricketer("Sinisa", .Croatia, .allrounder)
    let jordan = Cricketer("Jordan", .USA, .batsman)
    let mihael = Cricketer("Mihael", .India, .batsman)
    let drazen = Cricketer("Drazen", .Australia, .bowler)
    let pero = Cricketer("Pero", .Australia, .batsman)
    let tonci = Cricketer("Antonio", .Croatia, .batsman)
    let luka = Cricketer("Luka", .India, .allrounder)
    
    let cricketers = [sinisa, jordan, mihael, drazen, pero, tonci, luka]
    
    let ocpFilter = OCPCricketFilter()
    
    for item in ocpFilter.filter(cricketers, TeamCondition(.Croatia)) {
        print("\(item.name) belogs to \(item.team)")
    }
}

//main()
main_new()
