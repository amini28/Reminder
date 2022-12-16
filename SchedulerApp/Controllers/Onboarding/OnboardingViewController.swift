//
//  OnboardingViewController.swift
//  SchedulerApp
//
//  Created by Amini on 26/07/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var coll: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                finishedButton.isHidden = false
                nextButton.isHidden = true
                skipButton.isHidden = true
            } else {
                finishedButton.isHidden = true
                nextButton.isHidden = false
                skipButton.isHidden = false

            }
                
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Be in Control of your meds", description: "", image: UIImage(named: "note_list")!, color: .blue),
            OnboardingSlide(title: "Expiration Food Reminder", description: "", image: UIImage(named: "note_list")!, color: .red),
            OnboardingSlide(title: "Bills Payments Reminder", description: "", image: UIImage(named: "note_list")!, color: .green),
            OnboardingSlide(title: "Smart water Reminder", description: "", image: UIImage(named: "note_list")!, color: .yellow),
            OnboardingSlide(title: "Anything Reminder", description: "", image: UIImage(named: "note_list")!, color: .gray)
        ]
        
        finishedButton.isHidden = true
        pageControl.numberOfPages = slides.count
        
        coll.delegate = self
        coll.dataSource = self

    }
    
    @IBAction func finishedOnboard(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNavigationController") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func nextSlide(_ sender: Any) {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        coll.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func skipOnboard(_ sender: Any) {
        currentPage = slides.count-1
        let indexPath = IndexPath(item: currentPage, section: 0)
        coll.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
