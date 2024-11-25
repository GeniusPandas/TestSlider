//
//  ViewController.m
//  TestSlider
//
//  Created by yl on 2024/4/22.
//
//
//  Description: <#输入文件实现功能描述信息#>


#import "ViewController.h"
#import "CustomSlider.h"
#import "Masonry/Masonry.h"
@interface ViewController ()

@property (nonatomic, strong) UILabel *valueLabel;

@property (nonatomic, strong) CustomSlider *slider;
@property (nonatomic, assign) BOOL isSliderTouchEnded;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建Slider
    // 1. 布局
    //        self.slider = [[CustomSlider alloc] initWithFrame:CGRectMake(20, 100, 200, 50)];
    self.slider = [[CustomSlider alloc] init];
    // 2. 布局
    self.slider.frame = CGRectMake(50, 200, 280, 50);
    
    // 自定义组件信息
    //    self.slider.customBackgroundColor = [UIColor yellowColor];
    //    self.slider.customTrackColor = [UIColor blueColor];
    //    self.slider.customThumbColor = [UIColor redColor];
    //    self.slider.customTrackHeight = 50.0;
    //    self.slider.customThumbHeight = 40.0;
    self.slider.minValue = 0.15;
    self.slider.maxValue = 1.0;
    
    self.slider.sliderValueChanged = ^(CGFloat value, BOOL isEnd) {
        
        [self updateLabelWithValue:value];
        
        if (isEnd) {
            NSLog(@"滑动结束: %f", value);
        }
    };
    
    
    [self.view addSubview:self.slider];
    
    // 3. 布局
    //    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.mas_equalTo(20);
    //        make.right.mas_equalTo(-20);
    //        make.top.mas_equalTo(100);
    //        make.height.mas_equalTo(50);
    //    }];
    
    //    self.slider.value = 0.3;
    
    // 创建Label
    self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 200, 30)];
    self.valueLabel.textColor = [UIColor blackColor];
    self.valueLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.valueLabel];
    
    
    // 初始显示Slider的初始值
    [self updateLabelWithValue:self.slider.value];
}

- (void)updateLabelWithValue:(CGFloat)value {
    self.valueLabel.text = [NSString stringWithFormat:@"%.2f", value];
}


@end
