//
//  ViewController.m
//  MFSubtractMaskDemo
//
//  Created by Lyman Li on 2018/11/3.
//  Copyright © 2018年 Lyman Li. All rights reserved.
//

#import "UIView+MFSubtractMask.h"

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIView *visualEffectContainer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.visualEffectContainer.hidden = YES;
}

- (IBAction)actionScale:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.blackView.subtractMaskView.transform = CGAffineTransformMakeScale(2, 2);
        self.visualEffectContainer.subtractMaskView.transform = CGAffineTransformMakeScale(2, 2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            self.blackView.subtractMaskView.transform = CGAffineTransformIdentity;
            self.visualEffectContainer.subtractMaskView.transform = CGAffineTransformIdentity;
        }];
    }];
}

- (IBAction)actionImage:(id)sender {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pikaqiu.png"]];
    imageView.frame = CGRectMake(30, 20, 100, 95);
    
    self.blackView.subtractMaskView = imageView;
    self.visualEffectContainer.subtractMaskView = imageView;
}

- (IBAction)actionText:(id)sender {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 240, 128)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:24];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"MFSubtractMask";
    
    self.blackView.subtractMaskView = label;
    self.visualEffectContainer.subtractMaskView = label;
}

@end
