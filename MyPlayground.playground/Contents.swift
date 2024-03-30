import UIKit

class Person {
    let name: String
    var yacht: Yacht?

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
   lazy var rentYacht: () -> Void = { [weak self] in
        guard let self = self else { return }
        print("\(self.name) is renting the yacht")
        self.yacht?.owner = self
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

class Yacht {
    let unit: String
    var owner: Person?

    init(unit: String) {
        self.unit = unit
        print("Yacht \(unit) is being initialized")
    }
   lazy var showOwner: () -> Void = { [unowned self] in
        guard let tenant = self.owner else {
            print("No owner in Yacht \(self.unit)")
            return
        }
       print("Owner in Yacht \(self.unit): \(owner?.name ?? <#default value#>)")
    }

    deinit {
        print("Yacht \(unit) is being deinitialized")
    }
}

var ლექსო: Person? = Person(name: "კარგი ლექსო")
var ლამბორჯინი: Yacht? = Yacht(unit: "ლამბო")

ლექსო?.yacht = ლამბორჯინი
ლამბორჯინი?.owner = ლექსო

ლექსო?.rentYacht()
ლამბორჯინი?.showOwner()

ლექსო = nil
ლამბორჯინი = nil





