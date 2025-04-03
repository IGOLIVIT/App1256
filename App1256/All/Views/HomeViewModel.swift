//
//  HomeViewModel.swift
//  App1256
//
//  Created by IGOR on 02/04/2025.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @AppStorage("name") var name: String = ""
    @AppStorage("balance") var balance: String = ""
    @AppStorage("wprof") var wprof: Int = 0
    @AppStorage("mprof") var mprof: Int = 0
    
    @Published var addname: String = ""
    @Published var addbalance: String = ""
    @Published var addwprof: Int = 0
    @Published var addmprof: Int = 0
    
    @Published var periods: [String] = ["1h", "1d", "1w", "1m", "1y"]
    @Published var currentPer: String = "1h"

    @Published var categories: [String] = ["All", "Translations", "Payment for services", "Purchases", "Investment", "Loans and borrowings"]
    @Published var currentCategory: String = "All"
    @Published var categoriesAdding: [String] = ["Translations", "Payment for services", "Purchases", "Investment", "Loans and borrowings"]
    @Published var catForAdd: String = "Translations"
    
    @Published var staties: [String] = ["Plan your budget", "Use non-cash payments", "Keep an eye on commissions", "Check statements regularly", "Invest wisely"]
    @Published var curStat: String = ""
    
    @Published var types: [String] = ["Arrival", "Expense"]
    @Published var curType: String = "Arrival"

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false
    @Published var isEdit: Bool = false
    @Published var isGraph: Bool = false
    @Published var isOperations: Bool = false

    @Published var opCat: String = ""
    @Published var opName: String = ""
    @Published var opSum: String = ""
    @Published var opDate: Date = Date()
    @Published var opType: String = ""
    @Published var opTag: String = ""

    @Published var operations: [OperModel] = []
    @Published var selectedOper: OperModel?

    func addOper() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "OperModel", into: context) as! OperModel

        loan.opCat = opCat
        loan.opName = opName
        loan.opSum = opSum
        loan.opDate = opDate
        loan.opType = opType
        loan.opTag = opTag

        CoreDataStack.shared.saveContext()
    }

    func fetchOpers() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<OperModel>(entityName: "OperModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.operations = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.operations = []
        }
    }
}
