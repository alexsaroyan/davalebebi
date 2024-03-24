import UIKit

// შევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.


class Book {
    let bookID: Int
    let title: String
    let author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool = false) {
        self.bookID = bookID
        self .title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func typeAsBorrowed() {
        isBorrowed = true
        print("The Book \(title) is typed as borrowed.")
    }
    
    func typeAsReturned() {
        isBorrowed = false
        print("The Book \(title) is typed as returned.")
    }
    }

let book1 = Book(bookID: 1, title: "კუკარაჩა", author: "ნოდარ დუმბაძე")
book1.typeAsBorrowed()
book1.typeAsReturned()



//შევქმნათ Class Owner

//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
//Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
//

class Owner {
    let ownerId: Int
    let name: String
    var borrowedBooks:[Book] = []
    
    init(ownerId: Int, name: String) {
        self.ownerId = ownerId
        self.name = name
    }
    
    func manageBook(_ book: Book, action: String) {
        switch action {
        case "borrow":
            borrowedBooks.append(book)
        case "return":
            if let index = borrowedBooks.firstIndex(where: { $0.title == book.title }) {
                borrowedBooks.remove(at: index)
            }
        default:
            break
        }
        let actionVerb = action == "borrow" ? "borrowed" : "returned"
        print("\(name) has \(actionVerb) the book '\(book.title)'.")
    }
}

let owner1 = Owner(ownerId: 1, name: "სერგო")
let book3 = Book(bookID: 1, title: "ქალაქში მიმინოს რა უნდა", author: "დუმბაძე")

owner1.manageBook(book3, action: "borrow")
owner1.manageBook(book3, action: "return")



//შევქმნათ Class Library
//
//Properties: Books Array, Owners Array.
//Designated Init.
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.


class Library {
    var books: [Book] = []
    var owners: [Owner] = []
    
    func addBook(_ book: Book) { books.append(book) }
    func addOwner(_ owner: Owner) { owners.append(owner) }
    
    func availableBooks() -> [Book] { books.filter { !$0.isBorrowed } }
    func borrowedBooks() -> [Book] { books.filter { $0.isBorrowed } }
    
    func findOwnerByID(_ id: Int) -> Owner? { owners.first { $0.ownerId == id } }
    
    func booksTakenByOwner(_ owner: Owner) -> [Book] {
        books.filter { book in
            book.isBorrowed && owner.borrowedBooks.contains { $0.bookID == book.bookID }
        }
    }
    
    func borrowBook(_ book: Book, by owner: Owner) {
        if !book.isBorrowed {
            book.isBorrowed = true
            owner.borrowedBooks.append(book)
            print("\(owner.name) has borrowed the book '\(book.title)'.")
        } else {
            print("The book '\(book.title)' is already borrowed.")
        }
    }
}

let library = Library()


let book2 = Book(bookID: 2, title: "კუკარაჩა", author: "დუმბაძე")

library.addBook(book1)



let owner2 = Owner(ownerId: 2, name: "ალექს2")

library.addOwner(owner1)


library.borrowBook(book1, by: owner1) 


//
//გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.
//
//


class Work {
    let workID: Int
    let title: String
    let author: String
    var isBorrowed: Bool
    
    init(workID: Int, title: String, author: String, isBorrowed: Bool = false) {
        self.workID = workID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func markAsBorrowed() {
        isBorrowed = true
        print("The work '\(title)' is marked as borrowed.")
    }
    
    func markAsReturned() {
        isBorrowed = false
        print("The work '\(title)' is marked as returned.")
    }
}


class Buyer {
    let buyerID: Int
    let name: String
    var borrowedWorks: [Work] = []
    
    init(buyerID: Int, name: String) {
        self.buyerID = buyerID
        self.name = name
    }
    
    func borrowWork(_ work: Work, from storehouse: Storehouse) {
        storehouse.borrowWork(work, by: self)
    }
    
    func returnWork(_ work: Work, to storehouse: Storehouse) {
        storehouse.returnWork(work, to: self)
    }
}


class Storehouse {
    var works: [Work] = []
    var buyers: [Buyer] = []
    
    func addWork(_ work: Work) {
        works.append(work)
    }
    
    func addBuyer(_ buyer: Buyer) {
        buyers.append(buyer)
    }
    
    func borrowWork(_ work: Work, by buyer: Buyer) {
        if let index = works.firstIndex(where: { $0.workID == work.workID }) {
            if !works[index].isBorrowed {
                works[index].isBorrowed = true
                buyer.borrowedWorks.append(works[index])
                print("\(buyer.name) has borrowed the work '\(work.title)'.")
            } else {
                print("The work '\(work.title)' is already borrowed.")
            }
        } else {
            print("The work '\(work.title)' is not available in the storehouse.")
        }
    }
    
    func returnWork(_ work: Work, to buyer: Buyer) {
        if let index = buyer.borrowedWorks.firstIndex(where: { $0.workID == work.workID }) {
            buyer.borrowedWorks.remove(at: index)
            if let workIndex = works.firstIndex(where: { $0.workID == work.workID }) {
                works[workIndex].isBorrowed = false
                print("\(buyer.name) has returned the work '\(work.title)'.")
            }
        } else {
            print("\(buyer.name) does not have the work '\(work.title)'.")
        }
    }
    
    func printCheckedOutWorks() {
        print("Works checked out from the storehouse:")
        for buyer in buyers {
            for work in buyer.borrowedWorks {
                print("\(buyer.name) has borrowed '\(work.title)' by \(work.author)")
            }
        }
    }
    
    func printAvailableWorks() {
        print("Available works in the storehouse:")
        for work in works {
            if !work.isBorrowed {
                print("'\(work.title)' by \(work.author)")
            }
        }
    }
    
    func printCheckedOutWorksBy(buyerName: String) {
        if let buyer = buyers.first(where: { $0.name == buyerName }) {
            print("Works checked out by \(buyerName):")
            for work in buyer.borrowedWorks {
                print("'\(work.title)' by \(work.author)")
            }
        } else {
            print("Buyer with name \(buyerName) not found.")
        }
    }
}


let monatreba = Work(workID: 1, title: "მონატრება", author: "ნოდარ დუმბაძე")
let umaduri = Work(workID: 2, title: "უმადური", author: "ნოდარ დუმბაძე")

let xvicha = Buyer(buyerID: 1, name: "ხვიჩა")
let gocha = Buyer(buyerID: 2, name: "გოჩა")
let storehouse = Storehouse()


storehouse.addWork(monatreba)
storehouse.addWork(umaduri)
storehouse.addBuyer(xvicha)
storehouse.addBuyer(gocha)
xvicha.borrowWork(monatreba, from: storehouse)
gocha.borrowWork(umaduri, from: storehouse)
xvicha.returnWork(monatreba, to: storehouse)
storehouse.printCheckedOutWorks()
storehouse.printAvailableWorks()
storehouse.printCheckedOutWorksBy(buyerName: "გოჩა")
