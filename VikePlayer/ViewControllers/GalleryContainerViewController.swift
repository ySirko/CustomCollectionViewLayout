//
//  GalleryContainerViewController.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

class GalleryContainerViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var androidBar: AndroidTabBar!
    
    // MARK: - Private Properties
    
    private var galleryPageViewController: GalleryPageViewController?
    
    // MARK: - IBActions
    
    @IBAction private func changeSegmentAction(sender: UISegmentedControl) {
        galleryPageViewController?.scrollToPageAtIndex(sender.selectedSegmentIndex)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInterface()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        galleryPageViewController = segue.destinationViewController as? GalleryPageViewController
    }
    
    // MARK: - Private Methods
    
    private func setUpUserInterface() {
        androidBar.tabsTitles = [Content.Photo.rawValue.uppercaseString, Content.Video.rawValue.uppercaseString]
    }
}

// MARK: - AndroidTabBarDelegate

extension GalleryContainerViewController: AndroidTabBarDelegate {
    
    func selectedTabWithIndex(index: Int) {
        galleryPageViewController?.scrollToPageAtIndex(index)
    }
}

