import UIKit

enum CarAction {
    case turnEngineOn, turnEngineOff, windowOpen, windowClose
    case enablePneumo, disablePneumo
    case loadTruck, unloadTruck
}


protocol Car {
    var wheelCount: Int { get set }
    var color: UIColor { get set }
    var isEngineOn: Bool { get set }
    var isWindowOpen: Bool { get set }
    func executeAction ( action: CarAction )
    
    }
    
extension Car {
    mutating func executeAction( action: CarAction) {
        switch action {
        case .turnEngineOff:
            guard isEngineOn else {
                print ("Двигатель уже выключен")
                return
            }
            
            isEngineOn = false
        case .turnEngineOn:
            guard !isEngineOn else {
                print ("Двигатель уже включен")
                return
            }
            
            isEngineOn = true
            
        }
    }
}

class SportCar: Car {
    var wheelCount: Int = 3
    var color: UIColor = .white
    var isEngineOn: Bool = false
    var isWindowOpen: Bool = false
    var isPneumoEnabled: Bool = false
    
    func executeAction(action: CarAction) {
        switch action {
        case .disablePneumo:
            guard isPneumoEnabled else {
                print ("Пневмо уже выключена")
                return
                
            }
            
            isPneumoEnabled = false
            
            case .enablePneumo:
            guard !isPneumoEnabled else {
                print ("Пневмо уже включена")
                return
            }
            isPneumoEnabled = true
        default:
            print ("Действие не поддерживается спорткаром")
            return
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "SportCar with \(wheelCount) wheels"
    }
}

class TrunkCar: Car {
    var wheelCount: Int
    var color: UIColor
    var isEngineOn: Bool = false
    var isWindowOpen: Bool = false
    var baggageCappacity: Int
    var currentbaggageUsedPlace: Int = 0
    
    init(capacity: Int, wheelCount: Int, color: UIColor) {
        baggageCappacity = capacity
        self.wheelCount = wheelCount
        self.color = color
    }
    
    func executeAction(action: CarAction) {
        if action == .loadTruck {
            currentbaggageUsedPlace = min(currentbaggageUsedPlace + 1, baggageCappacity)
        }
        else if action == .unloadTruck {
            currentbaggageUsedPlace = max (currentbaggageUsedPlace - 1, 0)
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "TrunkCar with \(wheelCount) wheels"
    }
}

let sportCar = SportCar()
sportCar.executeAction(action: .enablePneumo)
print (sportCar)
