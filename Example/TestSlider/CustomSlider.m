//
//  CustomSlider.m
//  TestSlider
//
//  Created by yl on 2024/4/22.
//  
//
//  Description: <#输入文件实现功能描述信息#>

#import "CustomSlider.h"

@implementation CustomSlider

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self presetValue];
        
        [self addTarget:self action:@selector(sliderValueChanged:forEvent:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (void)sliderValueChanged:(UISlider *)sender forEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    switch (touch.phase) {
        case UITouchPhaseBegan:
            break;
        case UITouchPhaseMoved:
            if (self.sliderValueChanged) {
                self.sliderValueChanged(sender.value, NO);
            }
            break;
        case UITouchPhaseEnded:
            if (self.sliderValueChanged) {
                self.sliderValueChanged(sender.value, YES);
            }
            break;
        default:
            break;
    }
}


- (void)presetValue {
    self.minTrackColor = [UIColor blueColor];
    self.maxTrackColor = [UIColor lightGrayColor];
    self.thumbColor = [UIColor whiteColor];
    self.trackHeight = 50;
    self.thumbHeight = 40;
    self.minValue = 0.0;
    self.maxValue = 1.0;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIImage *minTrackImage = [self imageWithColor:self.minTrackColor size:CGSizeMake(self.frame.size.width, self.trackHeight)];
    UIImage *maxTrackImage = [self imageWithColor:self.maxTrackColor size:CGSizeMake(self.frame.size.width, self.trackHeight)];
    [self setMinimumTrackImage:minTrackImage forState:UIControlStateNormal];
    [self setMaximumTrackImage:maxTrackImage forState:UIControlStateNormal];
    
    UIImage *thumbImage = [self thumbImageWithTopColor:self.thumbColor bottomColor:self.minTrackColor thumbHeight:self.thumbHeight size:CGSizeMake(self.trackHeight, self.trackHeight)];
    [self setThumbImage:thumbImage forState:UIControlStateNormal];
}

- (UIImage *)thumbImageWithTopColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor thumbHeight:(CGFloat)thumbHeight size:(CGSize)size {

    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 绘制底部蓝色圆形
    CGRect bottomRect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    [bottomColor setFill];
    CGContextFillEllipseInRect(context, bottomRect);
    
    // 计算白色圆形的直径
    CGFloat diameter = thumbHeight;
    // 计算白色圆形的起始点
    CGFloat startX = (size.width - diameter) / 2.0;
    CGFloat startY = (size.height - diameter) / 2.0;
    // 绘制顶部白色圆形
    CGRect topRect = CGRectMake(startX, startY, diameter, diameter);
    [topColor setFill];
    CGContextFillEllipseInRect(context, topRect);
    
    UIImage *thumbImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return thumbImage;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:size.height / 2.0];
    [color setFill];
    [roundedRect fill];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setMinValue:(CGFloat)minValue {
    _minValue = minValue;
    [self setMinimumValue:minValue];
}

- (void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
    [self setMaximumValue:maxValue];
}

@end
