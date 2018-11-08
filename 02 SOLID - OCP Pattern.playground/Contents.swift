// Open closed principle (OCP)
// one should be able to extend a class behaviour without modofiying it
// Any class followong OCP should fulfill two citteria
// 1) Open for extension. This nesures that the class behaviour can be extended In real world scenario requirements keep changing
// 2) Closed for modification

// Example
// 
import Foundation
import UIKit

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
}

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
    
    for item in cricketerFilter.filterByTeam(cricketers, .Croatia) {
        print("\(item.name) belongs to Croatia Team")
    }
}

main()
