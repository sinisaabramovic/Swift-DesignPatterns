// Example for single responsibility pattern
// Single responsibility patterns directs that class should have one and only one reason to change
// and also that every class should have one method

import UIKit
import Foundation

// helps for checkig in and checking out team members
class TeamRegister: CustomStringConvertible
{
    var teamMembers = [String]()
    var memberCount = 0
    
    func checkInGuest(_ name: String) -> Int
    {
        memberCount += 1
        teamMembers.append("\(memberCount) - \(name)")
        return memberCount - 1
    }
    
    // takes index of type integer as a parameter and removes the guest from register
    func checkOutGuest(_ index: Int)
    {
        teamMembers.remove(at: index)
    }
    
    var description: String{
        return teamMembers.joined(separator: "\n")
    }
}

// TeamConveyance class has two major responsibilities
// takePlayersToStadium
// dropPlayersBackAtHotel
class TeamConveyance
{
    // takePlayersToStadium - takes a parameter of type TeamRegister and drops all the players at the stadium
    func takePlayersToStadium(_ teamRegister: TeamRegister)
    {
        print("Taking players \n \(teamRegister.description) \n to the Stadium")
    }
    
    // takes players back to Hotel
    func dropPlayersBackAtHotel(){
        print("Dropping all the players back at Hotel")
    }
}

// basic run time function, eq. to C/C++ main
func main()
{
    let teamRegister = TeamRegister()
    let player1 = teamRegister.checkInGuest("Player - One")
    let player2 = teamRegister.checkInGuest("Player - Two")
    
    print(teamRegister)
    
    teamRegister.checkOutGuest(1)
    print("---------------------------")
    print(teamRegister)
    
    let player3 = teamRegister.checkInGuest("Player - Three")
    
    print("---------------------------")
    print(teamRegister)
    
    let teamBus = TeamConveyance()
    teamBus.takePlayersToStadium(teamRegister)
    
     print("------Match Over-------")
    teamBus.dropPlayersBackAtHotel()
}

// Call for main function
main()
