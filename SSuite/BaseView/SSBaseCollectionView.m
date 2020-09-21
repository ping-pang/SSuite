//
//  SSBaseCollectionView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/17.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSBaseCollectionView.h"

@implementation SSBaseCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
