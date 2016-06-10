//
//  AndroidTabBar.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/9/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

@objc public protocol AndroidTabBarDelegate: class {
    
    func selectedTabWithIndex(index: Int)
}

public class AndroidTabBar: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: - Public Properties
    
    @IBOutlet public var delegate: AndroidTabBarDelegate?
    public var tabsTitles: [String]?
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
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
        registerNibs()
        
//        let firstTabPath = NSIndexPath(forItem: 0, inSection: 0)
//        collectionView.selectItemAtIndexPath(firstTabPath, animated: true, scrollPosition: .Right)
//        let frame = collectionView.cellForItemAtIndexPath(firstTabPath)
//        print(frame)
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        let view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        addSubview(view)
    }
    
    private func registerNibs() {
        collectionView.registerNib(TabItemCollectionViewCell.nib, forCellWithReuseIdentifier: TabItemCollectionViewCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource

extension AndroidTabBar: UICollectionViewDelegate {
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // TODO: handle tap
        print("select item: \(indexPath.row)")
        delegate?.selectedTabWithIndex(indexPath.row)
    }
    
    public func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print("deselect item: \(indexPath.row)")
    }
}

// MARK: - UICollectionViewDelegate

extension AndroidTabBar: UICollectionViewDataSource {
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabsTitles?.count ?? 0
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(TabItemCollectionViewCell.identifier, forIndexPath: indexPath) as! TabItemCollectionViewCell
        cell.title = tabsTitles?[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout

extension AndroidTabBar: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = CGRectGetWidth(collectionView.bounds)
        let height = CGRectGetHeight(collectionView.bounds)
        return CGSize(width: width/CGFloat(tabsTitles?.count ?? 0), height: height)
    }
}

