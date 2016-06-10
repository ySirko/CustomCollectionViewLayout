//
//  CollectionLayout.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import Foundation

import UIKit

public class CollectionLayout: UICollectionViewLayout {
    
    public enum Cell {
        static let defaultCellHeight: CGFloat  = 85
        static let expandedCellHeight: CGFloat = 207
    }
    
    // MARK: - Properties
    
    let dragOffset: CGFloat = Cell.expandedCellHeight - Cell.defaultCellHeight
    var attributesList = [UICollectionViewLayoutAttributes]()
    
    var expandedItemIndex: Int {
        get {
            return max(0, Int(collectionView!.contentOffset.y / dragOffset))
        }
    }
    
    var nextItemPercentageOffset: CGFloat {
        get {
            return (collectionView!.contentOffset.y / dragOffset) - CGFloat(expandedItemIndex)
        }
    }
    
    var width: CGFloat {
        get {
            return CGRectGetWidth(collectionView!.bounds)
        }
    }
    
    var height: CGFloat {
        get {
            return CGRectGetHeight(collectionView!.bounds)
        }
    }
    
    var numberOfItems: Int {
        get {
            return collectionView!.numberOfItemsInSection(0)
        }
    }
    
    // MARK: - UICollectionViewLayout
    
    public override func collectionViewContentSize() -> CGSize {
        let contentHeight = (CGFloat(numberOfItems) * dragOffset) + (height - dragOffset)
        return CGSize(width: width, height: contentHeight)
    }
    
    public override func prepareLayout() {
        attributesList.removeAll()
        
        let defaultHeight = Cell.defaultCellHeight
        let expandedHeight = Cell.expandedCellHeight
        
        var y: CGFloat = 0
        
        for index in 0..<numberOfItems {
            
            let indexPath = NSIndexPath(forItem: index, inSection: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            attributes.zIndex = index
            
            var height = defaultHeight
            
            if indexPath.item == expandedItemIndex {
                let offset = defaultHeight * nextItemPercentageOffset
                y = collectionView!.contentOffset.y - offset
                height = expandedHeight
            } else if indexPath.item == (expandedItemIndex + 1) && indexPath.item != numberOfItems {
                let maxY = y + defaultHeight
                height = defaultHeight + max(dragOffset * nextItemPercentageOffset, 0)
                y = maxY - height
            }
            
            attributes.frame = CGRect(x: 0, y: y, width: width, height: height)
            attributesList.append(attributes)
            y = CGRectGetMaxY(attributes.frame)
        }
    }
    
    public override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList.filter({ return CGRectIntersectsRect($0.frame, rect) })
    }
    
    public override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let itemIndex = round(proposedContentOffset.y / dragOffset)
        let yOffset = itemIndex * dragOffset
        return CGPoint(x: 0, y: yOffset)
    }
    
    public override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
}

