import Foundation

protocol getInfo {
    func printInfo ()
}

enum Currency : String {
    case RUB = "RUB"
    case EUR = "EUR"
    case USD = "USD"
}

class Account : getInfo {
    var id : Int
    var balance : Float
    var currency : Currency!
    var Description : String = ""
    var Offer : String?
    

init(id: Int, balance: Float, currency: String, Description: String, Offer: String? = nil) {
    self.id = id
    self.balance = balance
    self.currency = Currency (rawValue: currency)!
    self.Description = Description
    self.Offer = Offer
  }
func printInfo () {
    print ("info of user\nid: \(id) \nbalance: \(balance) \ncurrency: \(currency.rawValue) \nDEscription: \(Description) \nOffer: \(Offer ?? "not Offer")")
   }
}


func FromStringToDate(StringDate: String) -> Date? {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "dd MMMM yyyy"
    return dateFormater.date(from: StringDate)
}
    
class ReissueInfo: getInfo {
    var date: Date
    var info: String
    var addres = "Головной офис"
    
    init(date: Date, info: String, addres: String = "Головной офис") {
        self.date = date
        self.info = info
        self.addres = addres
    }
    
    func printInfo() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd --- mm --- yyyy"
        print("Reissue Information \ndate: \(dateFormatter) \ninfo: \(info) \naddress: \(addres)")
    }
}


class Card: Account {
    var reissueInfo: ReissueInfo?
    
    
    init(id: Int, balance: Double, currency: String, reissueInfo: ReissueInfo? = nil, Description: String, Offer: String? = nil){
        super.init(id: id, balance: Float(balance), currency: currency, Description: Description, Offer: Offer)
        self.reissueInfo = reissueInfo
    }
    
    override func printInfo() {
        print("Card \nid: \(id) \nbalance: \(balance) \nreissue: \(reissueInfo?.addres ?? "no reissue") \ncurrency: \(currency?.rawValue ?? "no currency")")
    }
}
    
    class ServerResponce: getInfo {
        var cards: [Card]
        var accounts: [Account]
        
        init(cardArray: [Card], accountArray: [Account]) {
            self.cards = cardArray
            self.accounts = accountArray
        }
        func printInfo() {
            print("Server Response \ncards: \(cards) \naccounts: \(accounts)")
        }
    }

    let ac1 = Account(id: 4, balance: 349.65, currency: "EUR", Description: "First user", Offer: "Take")
    
let ac2 = Account(id: 29, balance: 440, currency: "USD", Description: "Second user")
    
    let accs:[Account] = [ac1, ac2]

var dateString = "16 --- 09 --- 2018"

var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd --- mm --- yyyy"

var date = dateFormatter.date(from: dateString)

let reissueInfo = ReissueInfo(date: date!, info: "Information")

let card1 = Card(id: 8, balance: 340.4 , currency: "RUB", reissueInfo: reissueInfo, Description: "info")
    
let card2 = Card(id:54, balance: 5000, currency: "EUR", Description: "info")
    
    let cards:[Card] = [card1, card2]
    
    let response = ServerResponce(cardArray: cards, accountArray: accs)
    
    var array = [getInfo]()
    
    array.append(contentsOf: cards)
    
    array.append(contentsOf: accs)
    
    array.append(response)
    
    for i in array {
        i.printInfo()
}
