//
//  WelcomePageView.swift
//  one tone
//
//  Created by Love on 21/03/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class WelcomePageView: UIPageViewController,UIPageViewControllerDelegate , UIPageViewControllerDataSource {

 
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        self.view.backgroundColor = UIColor.clear
        
        let p1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "pageOne")
        let p2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "pageTwo")
        let p3: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "pageThree")
        
        // etc ...
        
        pages.append(p1)
        pages.append(p2)
        pages.append(p3)
        
        
        
        
        
        // etc ...
        
        setViewControllers([p1], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        
        for view in self.view.subviews {
            if view.isKind(of:UIScrollView.self) {
                view.frame = UIScreen.main.bounds
            } else if view.isKind(of:UIPageControl.self) {
                view.backgroundColor = UIColor.clear
            }
        }
        
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController)-> UIViewController? {
        
        let cur = pages.index(of: viewController)!
        
        // if you prefer to NOT scroll circularly, simply add here:
        if cur == 0 { return nil }
        
        let prev = abs((cur - 1) % pages.count)
        return pages[prev]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController)-> UIViewController? {
        
        let cur = pages.index(of: viewController)!
        
        // if you prefer to NOT scroll circularly, simply add here:
        if cur == (pages.count - 1) { return nil }
        
        let nxt = abs((cur + 1) % pages.count)
        return pages[nxt]
    }
    
    func presentationIndex(for pageViewController: UIPageViewController)-> Int {
        return 0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for view in self.view.subviews{
            if view is UIScrollView{
                view.frame = UIScreen.main.bounds
            }else if view is UIPageControl{
                
                view.backgroundColor = UIColor.clear
                view.frame.origin.y = self.view.frame.height - self.view.frame.height/18
                
                view.subviews.forEach {
                    $0.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
                
            }
            
        }
        
        
        
    }
    
    
    private func setupPageControl() {
        
        
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.lightGray
        appearance.currentPageIndicatorTintColor = UIColor.blue
        
        
        
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        setupPageControl()
        return self.pages.count
    }
    
}

