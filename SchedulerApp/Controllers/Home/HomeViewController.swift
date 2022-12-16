//
//  HomeViewController.swift
//  SchedulerApp
//
//  Created by Amini on 28/07/22.
//

import UIKit
import CoreData
import EventKit

class HomeViewController: UIViewController {

    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var currentTasksLabel: UILabel!
    
    @IBOutlet weak var addTaskButton: UIImageView!
    @IBOutlet weak var dateCollection: UICollectionView!
    @IBOutlet weak var tasksTable: UITableView!
    
    @IBOutlet weak var yearSelection: UIView!
    @IBOutlet weak var monthSelection: UIView!
    
    @IBOutlet weak var selectedMonth: UILabel!
    @IBOutlet weak var selectedYear: UILabel!
    
    var daysOfSelectedMonth: [String] = []
    var tasksOfSelectedDay: [Task] = []

    private var allTasks = [Tasks]()
    
    var currentDate: Date = Date()
    var currentCalendar: Date = Date()
    
    var eventStore: EKEventStore = EKEventStore()
    
    var dateFormmatter: DateFormatter = DateFormatter()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        title = "Task"
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "slider.vertical.3"), style: .plain, target: self, action: #selector(actionSettings))
        settingButton.tintColor = .black
        navigationItem.rightBarButtonItems = [
            settingButton
        ]
        
        dateCollection.delegate = self
        dateCollection.dataSource = self
        
        tasksTable.delegate = self
        tasksTable.dataSource = self
        
        addTaskButton.isUserInteractionEnabled = true
        let tapTask = UITapGestureRecognizer(target: self, action: #selector(actionAddNewTask))
        addTaskButton.addGestureRecognizer(tapTask)
        
        yearSelection.isUserInteractionEnabled = true
        yearSelection.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionSelectionYear)))
        
        monthSelection.isUserInteractionEnabled = true
        monthSelection.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionSelectionMonth)))
        
        dateCalculation()
    }
    
    private func dateCalculation() {
        
        dateFormmatter.timeZone = .current
        dateFormmatter.dateStyle = .medium
        dateFormmatter.timeStyle = .medium
        
        
        let dateString = dateFormmatter.string(from: currentDate)

        print("\(dateString)")
    }
    
    private func getTasks(_ date: Date) {
        
        let predicate = NSPredicate(format: "taskDate = %@", date as CVarArg)
        let fetchRequest = Tasks.fetchRequest()
        fetchRequest.predicate = predicate
        
        do {
            allTasks = try context.fetch(fetchRequest)
            
            DispatchQueue.main.async {
                self.tasksTable.reloadData()
            }
        } catch {
            
        }
    }
    
    
    @objc private func actionAddNewTask(){

        guard let controller = storyboard?.instantiateViewController(withIdentifier: "CreateTaskViewController") else { return }
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc private func actionSettings(){
        print("test action setting")
    }
    
    @objc private func actionSelectionMonth(){
        
    }
    
    @objc private func actionSelectionYear(){
        
    }
        
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeDateCollectionViewCell.identifier, for: indexPath) as! HomeDateCollectionViewCell
        
        cell.setup(Date())
        
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTaskTableViewCell.identifier, for: indexPath) as! HomeTaskTableViewCell
        
        let newTask = Task(title: "Its Title", description: "Its Description", date: "31 Jul, 2022 at 8:56:23 PM")
        cell.setup(newTask)
        
        return cell
    }
    
    
}

