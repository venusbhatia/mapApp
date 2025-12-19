//  Created by Venus Bhatia on 13/12/2025.
//

import Foundation
import MapKit

//Conforming to Equatable means,if we have 2 different locations in our code,how does the compiler differentiate and how can we set one location equal to another location.
// The compiler would want to know whether these locations are equal or they are different. Are they same thing or different. Similiar to Identifiable.

struct Location: Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: URL
    var id: String {
        return name + cityName
    }
    
    //Equatable
    //if we have 2 locations, left hand side and right hand side,
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

/*

 Location(
     name: "Colosseum",
     cityName: "Rome",
     coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
     description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
     imageNames: [
         "rome-colosseum-1",
         "rome-colosseum-2",
         "rome-colosseum-3",
     ],
     link: "https://en.wikipedia.org/wiki/Colosseum")
 
 */
