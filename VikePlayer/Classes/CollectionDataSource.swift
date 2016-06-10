//
//  CollectionDataSource.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

public class CollectionDataSource<Model, Cell: UICollectionViewCell where Cell: Identifiably>: NSObject, UICollectionViewDataSource {
    
    typealias ConfigurationClosure = (model: Model, cell: Cell) -> Void
    
    // MARK: - Properties
    
    private(set) var configurationClosure: ConfigurationClosure?
    public var items: [Model]?
    
    // MARK: - Initializers
    
    init(items: [Model]? = [], configurationClosure: ConfigurationClosure? = nil) {
        self.items = items
        self.configurationClosure = configurationClosure
    }
    
    // MARK: - UICollectionViewDataSource
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Cell.identifier, forIndexPath: indexPath)
        
        if let item = items?[indexPath.row], cell = cell as? Cell {
            configurationClosure?(model: item, cell: cell)
        }
        
        return cell
    }
}