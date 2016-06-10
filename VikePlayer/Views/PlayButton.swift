//
//  PlayButton.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/9/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

public class PlayButton: UIButton {
    
    public enum PlayButtonState {
        case Play
        case Pause
    }

    // MARK: - Public Properties
    
    public var buttonState: PlayButtonState? {
        didSet {
            // TODO: Change state
        }
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Private Methods
    
    private func setup() {
        
    }
}

