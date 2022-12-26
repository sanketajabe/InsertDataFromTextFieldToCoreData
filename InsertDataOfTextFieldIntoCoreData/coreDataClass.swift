//
//  coreDataClass.swift
//  InsertDataOfTextFieldIntoCoreData
//
//  Created by Apple on 16/12/22.
//

import Foundation
import UIKit
import CoreData
class coreDataClass{
    init(){
        
    }
    func insertStudentRecords(rno : Int, name : String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let studEntity = NSEntityDescription.entity(forEntityName: "Student", in: managedContext)
        
        let stud = NSManagedObject(entity: studEntity!, insertInto: managedContext)
        stud.setValue(rno, forKey: "rollNo")
        stud.setValue(name, forKey: "name")
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Data Cannot be saved \(error)")
        }
    }
//Mark:- Display Record In Student Table
    func retriveStudentRecords(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        do{
            let fetchResult = try managedContext.fetch(fetchRequest)
            
            for eachFetchResult in fetchResult as! [NSManagedObject]{
                print("The Student Records \(String(describing: eachFetchResult.value(forKey: "rollNo"))) -- \(String(describing: eachFetchResult.value(forKey: "name")))")
            
            }
        }catch{
            print("error")
        }
    }
    //Mark:- Insert Record In Employee Table
    func updateEmployeeRecords(rno : Int){
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            let fetchRequestQueryForUpdate : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Student")
            
            fetchRequestQueryForUpdate.predicate = NSPredicate(format: "rollNo = %@", "12")
            do{
                let studObjects = try managedContext.fetch(fetchRequestQueryForUpdate)
                let studObj = studObjects[0] as! NSManagedObject
                studObj.setValue(rno, forKey: "rollNo")
                try managedContext.save()
            }catch{
                print("error in updating records")
            }
        }
        
    //Mark:- Insert Record In Employee Table
    func deleteEmployeeRecords(name : String){
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                return
            }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            let fetchRequestForDelete : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        fetchRequestForDelete.predicate = NSPredicate(format: "name =%@", "name")
            do{
                let students = try managedContext.fetch(fetchRequestForDelete)
                let studentRecordToBeDeleted = students[0] as! NSManagedObject
                managedContext.delete(studentRecordToBeDeleted)
                print("student record \(studentRecordToBeDeleted) is deleted")
                do{
                    try managedContext.save()
                }catch{
                    print("error")
                }
                
            }catch{
                print("Employee Record Deletion failed")
            }
        }
}
