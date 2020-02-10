




import Foundation
import SQLite


class RecentDatabase {
static let shared:RecentDatabase = RecentDatabase()
    private let db: Connection?
    
    
    private let tblProduct = Table("JadyUserChat")
    private let id = Expression<Int64>("id")
    private let user_id = Expression<String?>("user_id")
    private let driver_id = Expression<String>("driver_id")
    private let message = Expression<String>("message")
    private let booking_id = Expression<String>("booking_id")
    private let type = Expression<String>("type")

    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/ishop.sqlite3")
            createTableProduct()
        } catch {
            db = nil
            print ("Unable to open database")
        }
    }
    
    func createTableProduct() {
        do {
            try db!.run(tblProduct.create(ifNotExists: true) { table in
                
                table.column(id, primaryKey: true)
                table.column(user_id)
                table.column(driver_id)
                table.column(message)
                table.column(booking_id)
                table.column(type)
                
            })
            print("create table successfully")
            
        } catch {
            print("Unable to create table")
        }
    }

    func addProduct(inputuser_id: String, inputdriver_id: String, inputmessage:String, inputbooking_id: String, inputtype:String) -> Int64? {
        do {
            let insert = tblProduct.insert(user_id <- inputuser_id, driver_id <- inputdriver_id, message <- inputmessage, booking_id <- inputbooking_id, type <- inputtype)
            
            let id = try db!.run(insert)
            print("Insert to tblProduct successfully")
            return id
        } catch {
            
            print("Cannot insert to database")
            
            return nil
        }
    }
    

    func queryAllProduct() -> [Product] {
        var products = [Product]()
        
        do {
            for product in try db!.prepare(self.tblProduct) {
                let newProduct = Product(id: product[id],
                                         user_id: product[user_id] ?? "",
                                         driver_id: product[driver_id], message:product[message],
                                         booking_id: product[booking_id], type:product[type])
                
                products.append(newProduct)
            }
        } catch {
            print("Cannot get list of product")
        }
        for product in products {
            print("each product = \(product)")
        }
        return products
    }
    
    func updateContact(productId:Int64, newProduct: Product) -> Bool {
        let tblFilterProduct = tblProduct.filter(id == productId)
        do {
            let update = tblFilterProduct.update([
                user_id <- newProduct.user_id,
                driver_id <- newProduct.driver_id,
                message <- newProduct.message,
                booking_id <- newProduct.booking_id,
                type <- newProduct.type])
            
            if try db!.run(update) > 0 {
                print("Update contact successfully")
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        
        return false
    }
    
    
    func deleteProduct(inputId: String) -> Bool {
        do {
            let tblFilterProduct = tblProduct.filter(user_id == inputId)
            try db!.run(tblFilterProduct.delete())
            print("delete sucessfully")
            return true
        } catch {
            
            print("Delete failed")
        }
        return false
    }


}

