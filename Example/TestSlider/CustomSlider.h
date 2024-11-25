//
//  CustomSlider.h
//  TestSlider
//
//  Created by yl on 2024/4/22.
//  
//
//  Description: <#输入文件实现功能描述信息#>
    

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomSlider : UISlider

@property (nonatomic, strong) UIColor *minTrackColor;
@property (nonatomic, strong) UIColor *maxTrackColor;
@property (nonatomic, strong) UIColor *thumbColor;
@property (nonatomic) CGFloat trackHeight;
@property (nonatomic) CGFloat thumbHeight;
@property (nonatomic) CGFloat minValue;
@property (nonatomic) CGFloat maxValue;

@property (nonatomic, copy) void(^sliderValueChanged) (CGFloat value, BOOL isEnd);

@end


NS_ASSUME_NONNULL_END
