//
//  CoreDataManager.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 8.10.2022.
//

import Foundation
import CoreData
import UIKit

class HotelCoreDataManager {
    
    lazy var appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var managedContext = appDelegate.persistentContainer.viewContext
    lazy var fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorited")
    lazy var entity = NSEntityDescription.entity(forEntityName: "Favorited", in: managedContext)!
    lazy var request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorited")
    
    
    
    func getData() -> [HotelDetailData]{
        var results = [NSManagedObject]()
        var data = [HotelDetailData]()
 
        do{
            results = try managedContext.fetch(fetchRequest)
            for item in results {
                let temp = HotelDetailData(hotelName: item.value(forKey: "hotelName") as! String, hotelAddress: item.value(forKey: "hotelAddress") as! String, hotelPrice: item.value(forKey: "hotelPrice") as! String,hotelId: item.value(forKey: "hotelId") as! Int)
                data.append(temp)
            }
            
        } catch let err as NSError{
            print("Error", err)
        }
        return data
    }
    
    func favoritedCount() -> Int? {
        let data = getData() 
        return data.count
    }
    
   
    
    func addData(data: HotelDetailData) {
        let event = NSManagedObject(entity: entity, insertInto: managedContext)
        
        event.setValue(data.hotelName, forKeyPath: "hotelName")
        event.setValue(data.hotelAddress, forKeyPath: "hotelAddress")
        event.setValue(data.hotelPrice, forKeyPath: "hotelPrice")
        event.setValue(data.hotelId, forKey: "hotelId")
        
        saveContext()
    }

   
    func deleteDataByRow(data: HotelDetailData) {
        do {
            let results = try managedContext.fetch(request) as! [NSManagedObject]
            for result in results{
          //      managedContext.delete(result)
                if(result.value(forKey: "hotelName") as! String == data.hotelName ){
                    managedContext.delete(result)
                }
            }
        } catch{
            print("error in deleting")
        }
        saveContext()
    }
    
    func saveContext(){
        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}
