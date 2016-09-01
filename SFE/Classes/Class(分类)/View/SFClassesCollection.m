//
//  SFClassesCollection.m
//  SFE
//
//  Created by ma c on 16/9/1.
//  Copyright © 2016年 shifei. All rights reserved.
//

#import "SFClassesCollection.h"
#import "SFEffectCollectionViewCell.h"
#import "SFBrandCollectionViewCell.h"
#import "SFHeaderCollectionReusableView.h"

@interface SFClassesCollection () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

static NSString * const effect = @"effectCell";
static NSString * const brand = @"brandCell";
static NSString * const header = @"header";
@implementation SFClassesCollection

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[SFEffectCollectionViewCell class] forCellWithReuseIdentifier:effect];
        [self registerClass:[SFBrandCollectionViewCell class] forCellWithReuseIdentifier:brand];
        
        [self registerClass:[SFHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header];
    }
    
    return self;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.effectArray.count;
    } else if (section == 1) {
        return self.classicClassArray.count;
    } else
        return self.recommendClassArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SFEffectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:effect forIndexPath:indexPath];
        [cell sizeToFit];
        cell.effectItem = self.effectArray[indexPath.row];
        return cell;
        
    } else {
        SFBrandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:brand forIndexPath:indexPath];
        [cell sizeToFit];
        
        if (indexPath.section == 1) {
            cell.brandItem = self.classicClassArray[indexPath.row];
            
        } else {
            cell.brandItem = self.recommendClassArray[indexPath.row];
            
        }
        return cell;
    }
    
}



/**返回头部或尾部*/
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        
        SFHeaderCollectionReusableView *resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:header forIndexPath:indexPath];
        if (indexPath.section == 0) {
            resuableView.titleLableText = @"功效";
            resuableView.backgroundColor = SFColor(239, 248, 251);
        }else if (indexPath.section == 1){
            resuableView.titleLableText = @"经典品牌";
            resuableView.backgroundColor = SFColor(252, 244, 243);
        }else{
            resuableView.titleLableText = @"推荐品牌";
            resuableView.backgroundColor = SFColor(252, 244, 243);
        }
        return resuableView;
    }
    
    return nil;
    
}


@end
