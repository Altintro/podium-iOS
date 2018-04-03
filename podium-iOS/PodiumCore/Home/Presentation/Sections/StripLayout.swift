//
//  StripCollectionViewLayout.swift
//  podium-iOS
//
//  Created by Tomás Ignacio Moyano on 3/26/18.
//  Copyright © 2018 Fernando Frances. All rights reserved.
//


import UIKit

final class StripLayout: UICollectionViewFlowLayout {
    
    private enum Constants {
        static let itemSize = CGSize(width: 125, height: 180)
        static let minimumLineSpacing: CGFloat = 16
        static let sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func prepare() {
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        
        scrollDirection = .horizontal
        itemSize = Constants.itemSize
        minimumLineSpacing = Constants.minimumLineSpacing
        sectionInset = Constants.sectionInset
    }
    
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let collectionView = collectionView else {
            return proposedContentOffset
        }
        
        let targetRect = CGRect(origin: CGPoint(x: proposedContentOffset.x, y: 0), size: collectionView.bounds.size)
        
        guard let attributes = layoutAttributesForElements(in: targetRect) else {
            return proposedContentOffset
        }
        
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        
        for itemAttributes in attributes {
            if itemAttributes.representedElementCategory != .cell {
                continue
            }
            
            let x = itemAttributes.frame.origin.x
            
            if abs(x - proposedContentOffset.x) < abs(offsetAdjustment) {
                offsetAdjustment = x - proposedContentOffset.x
            }
        }
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment - sectionInset.left, y: proposedContentOffset.y)
    }
}


