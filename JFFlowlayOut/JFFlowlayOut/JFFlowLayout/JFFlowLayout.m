//
//  JFFlowLayout.m
//  FlowLayoutLabel
//
//  Created by 闪电科技 on 2018/12/18.
//  Copyright © 2018年 闪电科技. All rights reserved.
//

#import "JFFlowLayout.h"
#import <objc/runtime.h>


JFFlowLayout *flowLayout = nil;
@implementation JFFlowLayout

+ (instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        flowLayout = [[JFFlowLayout alloc]init];
    });
    return flowLayout;
}

+ (void)createHistoryViewWithTitleArray:(NSArray *)titleArray toView:(UIView *)targetView{
    
    CGFloat leftSpace = 30; //整体距离左边距离
    CGFloat rightSpace = 30; //整体距离右边距离
    CGFloat topSpace = 50; //整体距离上边距离
    CGFloat itemhorizontalSpace = 5; //每个label间的横向距离
    CGFloat itemVerticalSpace = 5; //每个label间的纵向距离
    CGFloat itemHeight = 24; //每个lable的高
    
    CGFloat currentRight = leftSpace;
    CGFloat currentBottom = topSpace;
    
    for (int i = 0; i < titleArray.count; i ++) {
        
        UILabel *titleLabel = ({
            UILabel *label = [[UILabel alloc]init];
            label.font = [UIFont systemFontOfSize:11];
            label.numberOfLines = 0;
            label.userInteractionEnabled = YES;
            label.textColor = [UIColor blackColor];
            label.layer.cornerRadius = itemHeight/2;
            label.layer.masksToBounds = YES;
            label.layer.borderWidth = 1;
            label.layer.borderColor = [UIColor lightGrayColor].CGColor;
            label.text = [NSString stringWithFormat:@"  %@  ",titleArray[i]];
            label;
        });
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:[JFFlowLayout shareInstance] action:@selector(tapAction:)];
        objc_setAssociatedObject(tap, @"sss", titleLabel.text, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        [titleLabel addGestureRecognizer:tap];
        
        [targetView addSubview:titleLabel];
        
        if (currentRight <= targetView.bounds.size.width - rightSpace) {
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(currentRight);
                make.height.mas_equalTo(itemHeight);
                make.top.mas_equalTo(currentBottom);
                make.width.mas_lessThanOrEqualTo(targetView.bounds.size.width - leftSpace - rightSpace);
            }];
            [titleLabel.superview layoutIfNeeded];
            currentRight += titleLabel.bounds.size.width + itemhorizontalSpace;
            
            if (currentRight > targetView.bounds.size.width - rightSpace) {
                currentRight = leftSpace;
                currentBottom += itemHeight + itemVerticalSpace;
                [titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(currentRight);
                    make.height.mas_equalTo(itemHeight);
                    make.top.mas_equalTo(currentBottom);
                    make.width.mas_lessThanOrEqualTo(targetView.bounds.size.width - leftSpace - rightSpace);
                }];
                
                [titleLabel.superview layoutIfNeeded];
                if (titleLabel.bounds.size.width >= (targetView.bounds.size.width - leftSpace - rightSpace)) {
                    currentBottom += itemHeight + itemVerticalSpace;
                    currentRight = leftSpace;
                }else{
                    currentRight += titleLabel.bounds.size.width + itemhorizontalSpace;
                }
            }
            
        }else if (currentRight > targetView.bounds.size.width - rightSpace) {
            currentRight = leftSpace;
            currentBottom += itemHeight + itemVerticalSpace;
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(currentRight);
                make.height.mas_equalTo(itemHeight);
                make.top.mas_equalTo(currentBottom);
                make.width.mas_lessThanOrEqualTo(targetView.bounds.size.width - leftSpace - rightSpace);
            }];
            
            [titleLabel.superview layoutIfNeeded];
            if (titleLabel.bounds.size.width >= (targetView.bounds.size.width - leftSpace - rightSpace)) {
                currentBottom += itemHeight + itemVerticalSpace;
                currentRight = leftSpace;
            }else{
                currentRight += titleLabel.bounds.size.width + itemhorizontalSpace;
            }
        }
        
    }
    
}


- (void)tapAction:(UITapGestureRecognizer *)tap{
    
    NSString *titleString = objc_getAssociatedObject(tap, @"sss");
    
    NSLog(@"%@",titleString);
}

@end
