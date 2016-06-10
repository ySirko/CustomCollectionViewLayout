//
//  ViewController.swift
//  VikePlayer
//
//  Created by Yuriy Sirko on 6/7/16.
//  Copyright © 2016 ThinkMobiles. All rights reserved.
//

import UIKit

public class MediaCollectionViewController: UICollectionViewController {

    // MARK: - Public Properties
    
    public var type: Content?
    
    // MARK: - Private Properties
    
    private lazy var dataSource: CollectionDataSource<PhotoModel, MediaCollectionViewCell> = {
        let dataSource = CollectionDataSource<PhotoModel, MediaCollectionViewCell>() { (model, cell) in
            // TODO: configure cell
            
            cell.titleLabel.text = model.title
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                if let urlString = model.backgroundImageURLString,
                    url = NSURL(string: urlString),
                    data = NSData(contentsOfURL: url) {
                    let image = UIImage(data: data)
                    dispatch_async(dispatch_get_main_queue(), {
                        cell.backgroundImage.image = image
                    })
                }
            })
        }
        return dataSource
    }()
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setUpDataSource()
    }
    
    // MARK: - Navigation
    
    public override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

    // MARK: - Private Methods
    
    private func setUpCollectionView() {
        collectionView?.dataSource = dataSource
    }
    
    private func setUpDataSource() {
        
        if type == Content.Photo {
            // TODO:
        } else if type == Content.Video {
            
        }
        
        // TODO: remove mock objects
        
        dataSource.items = [
            PhotoModel(title: "London", imageURLString: "http://66.media.tumblr.com/367605869d1104c3412c8b60142f69d7/tumblr_mzqs58t8691rm1f2go3_500.jpg"),
            PhotoModel(title: "Lifestyle", imageURLString: "http://67.media.tumblr.com/eb4006806594585fe530889e9566d3f0/tumblr_mzqs58t8691rm1f2go2_500.jpg"),
            PhotoModel(title: "NY Trip", imageURLString: "http://67.media.tumblr.com/bffb29e418a58d3c3258f627034ffc77/tumblr_mzqs58t8691rm1f2go1_500.jpg"),
            PhotoModel(title: "London", imageURLString: "http://66.media.tumblr.com/367605869d1104c3412c8b60142f69d7/tumblr_mzqs58t8691rm1f2go3_500.jpg"),
            PhotoModel(title: "Lifestyle", imageURLString: "http://67.media.tumblr.com/eb4006806594585fe530889e9566d3f0/tumblr_mzqs58t8691rm1f2go2_500.jpg"),
            PhotoModel(title: "NY Trip", imageURLString: "http://67.media.tumblr.com/bffb29e418a58d3c3258f627034ffc77/tumblr_mzqs58t8691rm1f2go1_500.jpg"),
            PhotoModel(title: "London", imageURLString: "http://66.media.tumblr.com/367605869d1104c3412c8b60142f69d7/tumblr_mzqs58t8691rm1f2go3_500.jpg"),
            PhotoModel(title: "Lifestyle", imageURLString: "http://67.media.tumblr.com/eb4006806594585fe530889e9566d3f0/tumblr_mzqs58t8691rm1f2go2_500.jpg"),
            PhotoModel(title: "NY Trip", imageURLString: "http://67.media.tumblr.com/bffb29e418a58d3c3258f627034ffc77/tumblr_mzqs58t8691rm1f2go1_500.jpg"),
            PhotoModel(title: "London", imageURLString: "http://66.media.tumblr.com/367605869d1104c3412c8b60142f69d7/tumblr_mzqs58t8691rm1f2go3_500.jpg"),
            PhotoModel(title: "Lifestyle", imageURLString: "http://67.media.tumblr.com/eb4006806594585fe530889e9566d3f0/tumblr_mzqs58t8691rm1f2go2_500.jpg"),
            PhotoModel(title: "NY Trip", imageURLString: "http://67.media.tumblr.com/bffb29e418a58d3c3258f627034ffc77/tumblr_mzqs58t8691rm1f2go1_500.jpg")
        ]
        collectionView?.reloadData()
    }
}

extension MediaCollectionViewController {
    
    public override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let layout = collectionView.collectionViewLayout as? CollectionLayout {
            let offset = layout.dragOffset * CGFloat(indexPath.item)
            if collectionView.contentOffset.y != offset {
                
                CATransaction.begin()
                CATransaction.setCompletionBlock({ 
                    // TODO: perform segue
                })

                collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
                CATransaction.commit()
            }
        }
    }
}

