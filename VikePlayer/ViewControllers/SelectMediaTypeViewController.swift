//
//  SelectMediaTypeViewController.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

class SelectMediaTypeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var aboutButton: UIButton!
    @IBOutlet private var photoBackgroundImageView: UIImageView!
    @IBOutlet private var videoBackgroundImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInterface()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setUpUserInterface() {
        photoBackgroundImageView.addInterpolatingMotionEffect(-15.0)
        videoBackgroundImageView.addInterpolatingMotionEffect(-15.0)
    }
}

