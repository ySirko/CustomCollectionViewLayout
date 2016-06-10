//
//  PlaybackView.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/8/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

@IBDesignable
public class PlaybackView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var elpsedTimeLabel: UILabel!
    @IBOutlet private var remainingTimeLabel: UILabel!
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var playButton: UIButton!
    
    // MARK: - Public Properties
    
    public var duration: Double? = 0.0
    public var elapsedTime: Double? {
        didSet {
            if let _ = elapsedTime {
                // TODO: update progress view
            }
        }
    }
    
    // MARK: - Private Properties
    
    private var remainingTime: Double? {
        get {
            guard let _ = elapsedTime, _ = duration else { return nil }
            return elapsedTime! - duration!
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Lifecycle
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        slider.setThumbImage(UIImage(named: "ic_track"), forState: UIControlState.Normal)
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view)
    }
}
