//
//  CreateTaskViewController.swift
//  SchedulerApp
//
//  Created by Amini on 28/07/22.
//

import UIKit

class CreateTaskViewController: UIViewController, UISheetPresentationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var selectedMonth: UILabel!
    @IBOutlet weak var dateCollections: UICollectionView!
    
    @IBOutlet weak var alertSelection: UISegmentedControl!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func saveButton(_ sender: Any) {
        
        //add new task
        let newTask = Tasks(context: context)
        newTask.title = ""
        newTask.descriptions = ""
        newTask.createdAt = ""
        newTask.alertTime = ""
        newTask.isAlertOn = false
        newTask.repetition = false
        newTask.taskDate = Date()
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let sheetPresentationController = presentationController as? UISheetPresentationController {
            sheetPresentationController.detents = [
                .medium(),
                .large()
            ]
            sheetPresentationController.delegate = self
            sheetPresentationController.selectedDetentIdentifier = .medium
            sheetPresentationController.prefersGrabberVisible = true
            sheetPresentationController.preferredCornerRadius = 15
        }
    }
    

}
