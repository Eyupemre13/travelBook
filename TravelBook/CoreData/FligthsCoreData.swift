//
//  FligthsCoreData.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 8.10.2022.
//

import Foundation
import CoreData
import UIKit

class FlightsCoreDataManager {
    
    lazy var appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var managedContext = appDelegate.persistentContainer.viewContext
    lazy var fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favorited")
    lazy var entity = NSEntityDescription.entity(forEntityName: "Favorited", in: managedContext)!
    lazy var request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorited")
    
    
    
    func getData() -> [FlightDetailData]{
        var results = [NSManagedObject]()
        var data = [FlightDetailData]()
 
        do{
            results = try managedContext.fetch(fetchRequest)
            for item in results {
                let temp = FlightDetailData(flightName: item.value(forKey: "flightName") as! String, fligthDesc: item.value(forKey: "flightDesc") as! String, flightInfo: item.value(forKey: "flightInfo") as! String)
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
    
   
    
    func addData(data: FlightDetailData) {
        let event = NSManagedObject(entity: entity, insertInto: managedContext)
        
        event.setValue(data.flightName, forKeyPath: "flightName")
        event.setValue(data.fligthDesc, forKeyPath: "flightDesc")
        event.setValue(data.flightInfo, forKeyPath: "flightInfo")
      
        
        saveContext()
    }

   
    func deleteDataByRow(data: FlightDetailData) {
        do {
            let results = try managedContext.fetch(request) as! [NSManagedObject]
            for result in results{
          //      managedContext.delete(result)
                if(result.value(forKey: "flightName") as! String == data.flightName ){
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

