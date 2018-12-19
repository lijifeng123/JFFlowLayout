//
//  JFFlowLayout.h
//  FlowLayoutLabel
//
//  Created by 闪电科技 on 2018/12/18.
//  Copyright © 2018年 闪电科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

NS_ASSUME_NONNULL_BEGIN

@interface JFFlowLayout : NSObject
/**
 @param titleArray 展示的数组
 @param targetView 展示的目标view
 */
+ (void)createHistoryViewWithTitleArray:(NSArray *)titleArray toView:(UIView *)targetView;

@end

NS_ASSUME_NONNULL_END
