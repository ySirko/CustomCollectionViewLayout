//
//  PageViewController.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

public class GalleryPageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    public lazy var photosViewController: MediaCollectionViewController = {
        let storyboard = UIStoryboard(storyboard: UIStoryboard.Storyboard.Main)
        return storyboard.instantiateViewControllerWithIdentifier(MediaCollectionViewController.identifier) as! MediaCollectionViewController
    }()
    
    public lazy var videosViewController: MediaCollectionViewController = {
        let storyboard = UIStoryboard(storyboard: UIStoryboard.Storyboard.Main)
        return storyboard.instantiateViewControllerWithIdentifier(MediaCollectionViewController.identifier) as! MediaCollectionViewController
    }()
    
    public lazy var viewControllersList: [UIViewController] = {
        return [self.photosViewController, self.videosViewController]
    }()
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUpControllers()
    }
    
    // MARK: - Public Methods
    
    public func scrollToPageAtIndex(index: Int) {
        guard 0...viewControllersList.count ~= index else { return }
        
        guard let currentController = viewControllers?.first else { return }
        let currentIndex = viewControllersList.indexOf(currentController)
        
        if currentIndex <= index {
            setViewControllers([ viewControllersList[index] ], direction: .Forward, animated: true, completion: nil)
        } else {
            setViewControllers([ viewControllersList[index] ], direction: .Reverse, animated: true, completion: nil)
        }
    }
    
    // MARK: - Private Methods
    
    private func setUpControllers() {
        
        if let firstViewController = viewControllersList.first {
            setViewControllers([ firstViewController ], direction: .Forward, animated: true, completion: nil)
        }
        
        self.dataSource = self
    }
}

// MARK: - UIPageViewControllerDataSource

extension GalleryPageViewController: UIPageViewControllerDataSource {
    
    public func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let controllerIndex = viewControllersList.indexOf(viewController) else { return nil }
        
        let nextIndex = controllerIndex + 1
        let count = viewControllersList.count
        let available = nextIndex < count
        
        return available ? viewControllersList[nextIndex] : nil
    }
    
    public func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let controllerIndex = viewControllersList.indexOf(viewController) else { return nil }
        
        let previousIndex = controllerIndex - 1
        let count = viewControllersList.count
        let available = 0...count ~= previousIndex
        
        return available ? viewControllersList[previousIndex] : nil
    }
}

