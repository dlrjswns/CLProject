//
//  PhotoPageController.swift
//  CL9_PhotoScroll
//
//  Created by 이건준 on 2022/01/01.
//

import UIKit

class PhotoPageController:UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    var currentIndex:Int?
    
    let model:[String] = ["photo1.png", "photo2.png", "photo3.png", "photo4.png", "photo5.png"]
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setPageViewControllers()
    }
    
    //MARK: -Set PageViewControllrs
    func setPageViewControllers(){
        self.delegate = self
        self.dataSource = self
        let currentIndex = self.currentIndex ?? 0
        if let viewController = getPhotoViewController(index: currentIndex){
        setViewControllers([viewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func getPhotoViewController(index:Int?)->PhotoViewController?{
        let vc = PhotoViewController()
        let index = index ?? 0
        let imageName = model[index]
        vc.photoView.image = UIImage(named: imageName)
        vc.photoIndex = index
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PhotoViewController{
            guard let index = viewController.photoIndex, index != 0 else {return nil}
            return getPhotoViewController(index: index-1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PhotoViewController{
            guard let index = viewController.photoIndex, index != model.count-1 else {return nil}
            return getPhotoViewController(index: index+1)
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return model.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex ?? 0
    }
}
