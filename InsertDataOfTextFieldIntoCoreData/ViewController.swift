//
//  ViewController.swift
//  InsertDataOfTextFieldIntoCoreData
//
//  Created by Apple on 16/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var rollNoTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
      getDataFromTextField()
    }
    func getDataFromTextField(){
        rollNoTextField.placeholder = "RollNo"
        nameTextField.placeholder = "Name"
    }
    
    @IBAction func BtnClkToPerformDataBaseOperation(_ sender: Any) {
        let rno = rollNoTextField.text
        let name = nameTextField.text
        rollNoTextField.text = " "
        nameTextField.text = " "
        let coredataInstance = coreDataClass()
//        coredataInstance.insertStudentRecords(rno:Int(rno!)!, name: name!)
//        coredataInstance.retriveStudentRecords()
        
//        coredataInstance.updateEmployeeRecords(rno: Int(rno!)!)
//        coredataInstance.retriveStudentRecords()

        coredataInstance.deleteEmployeeRecords(name: name!)
        coredataInstance.retriveStudentRecords()
    }
}

