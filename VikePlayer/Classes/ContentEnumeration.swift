//
//  ContentEnumeration.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/9/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

public enum Content: String {
    case Photo
    case Video
    
    public var stringValue: String {
        switch self {
        case Photo:
            return "Photo"
        case Video:
            return "Video"
        }
    }
}