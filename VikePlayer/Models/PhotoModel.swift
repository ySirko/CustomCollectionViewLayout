//
//  PhotoModel.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import Foundation

public class PhotoModel {
    
    // MARK: - Properties
    
    public var title: String?
    public var backgroundImageURLString: String?
    
    // MARK: - Initializers
    
    init(title: String?, imageURLString: String?) {
        self.title = title
        self.backgroundImageURLString  = imageURLString
    }
}