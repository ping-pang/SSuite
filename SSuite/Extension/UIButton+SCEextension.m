//
//  UIButton+SCEextension.m
//  shopping
//
//  Created by zhangtao on 2020/7/7.
//  Copyright © 2020 jsmcc. All rights reserved.
//

#import "UIButton+SCEextension.h"

@implementation UIButton (SCEextension)


- (void)layoutButtonWithEdgeInsetsStyle:(XGButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space {
    /**
     *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    /**
     MKButtonEdgeInsetsStyleTop, // image在上，label在下
     MKButtonEdgeInsetsStyleLeft, // image在左，label在右
     MKButtonEdgeInsetsStyleBottom, // image在下，label在上
     MKButtonEdgeInsetsStyleRight // image在右，label在左
     */
    switch (style) {
        case XGButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case XGButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case XGButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case XGButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

-(void)badgeNum:(NSInteger)num fontSize:(NSInteger)size bgColor:(nonnull UIColor *)color{
    
    UILabel *lab = [self viewWithTag:202077530];
    if (!lab) {
       lab = [[UILabel alloc]initWithFrame:CGRectZero];
        lab.textColor= HEX(@"#FFFFFF");
        [lab setTag:202077530];
        lab.font = [UIFont systemFontOfSize:size];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.layer.masksToBounds = YES;
        lab.backgroundColor = color;
        lab.layer.cornerRadius = 7.5;//lab.frame.size.height/2;

    }
    
   lab.text = [NSString stringWithFormat:@"%ld",num];
//    [lab sizeToFit];
    [self addSubview:lab];

    if (num<10) {
        [lab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView).mas_offset(-5);
            make.right.equalTo(self.imageView).mas_offset(5);
            make.width.height.mas_equalTo(15);
        }];
    }else{
         [lab sizeToFit];
        [lab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView).mas_offset(-5);
//            make.right.equalTo(self.imageView).mas_offset(CGRectGetWidth(lab.frame));
            make.left.mas_equalTo(self.imageView.mas_right).mas_offset(-10);
            make.height.mas_equalTo(15);
            make.width.mas_equalTo(lab.frame.size.width+5);
          }];
    }
    
  
    
//    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.imageView).mas_offset(-5);
//        make.right.equalTo(self.imageView).mas_offset(5);
//        make.width.height.mas_equalTo(lab.frame.size.width+5);
//    }];

}



@end
