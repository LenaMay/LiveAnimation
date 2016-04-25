//
//  ViewController.m
//  ReplicatorLayerDemo
//
//  Created by Mac_ZL on 16/1/19.
//  Copyright © 2016年 Mac_ZL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self animation1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)animation1
{
    CAReplicatorLayer *layer = [[CAReplicatorLayer alloc] init];
    
    [layer setBounds:CGRectMake(0, 0, 160, 60)];
    [layer setPosition:self.view.center];
    [layer setBackgroundColor:[UIColor greenColor].CGColor];
    layer.instanceCount = 4;
    layer.instanceTransform = CATransform3DMakeTranslation(40.0, 0.0, 0.0);
    layer.instanceDelay = 0.33;
//    layer.masksToBounds = YES;
    [self.view.layer addSublayer:layer];
    
    CALayer *bar = [[CALayer alloc] init];
    [bar setBounds:CGRectMake(0, 0, 8, 40)];
    [bar setPosition:CGPointMake(10, 75)];  
    [bar setCornerRadius:2];
    [bar setBackgroundColor:[UIColor redColor].CGColor];
    [layer addSublayer:bar];
    
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnim.toValue = @(bar.position.y - 35.0);
    moveAnim.duration = 0.5;
    moveAnim.autoreverses = YES;
    moveAnim.repeatCount = MAXFLOAT;
    [bar addAnimation:moveAnim forKey:nil];
}
- (void)animation2
{
    CAReplicatorLayer *layer = [[CAReplicatorLayer alloc] init];
    
    [layer setBounds:CGRectMake(0, 0, 200, 200)];
    [layer setPosition:self.view.center];
    [layer setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.75].CGColor];
    [layer setCornerRadius:10];
    layer.instanceColor = [UIColor redColor].CGColor;

//    layer.instanceCount = 3;
//    layer.instanceTransform = CATransform3DMakeTranslation(20.0, 0.0, 0.0);
//    layer.instanceDelay = 0.33;
    layer.masksToBounds = YES;
    [self.view.layer addSublayer:layer];
    
    CALayer *dot = [[CALayer alloc] init];
    
    dot.bounds =CGRectMake(0, 0, 14, 14) ;
    dot.position = CGPointMake(100, 40);
    dot.backgroundColor = [UIColor colorWithWhite:.8 alpha:1].CGColor;
    dot.borderColor = [UIColor colorWithWhite:1 alpha:1].CGColor;
    dot.cornerRadius = 7;
    
    [layer addSublayer:dot];
    
    NSInteger nrDots = 15;
    
    CFTimeInterval duration = 1.5;

    layer.instanceCount = nrDots;
    CGFloat angle = (CGFloat)(2*M_PI) / nrDots;
    layer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
    layer.instanceDelay = duration/nrDots;


    
    
    CABasicAnimation *shrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrink.fromValue = @(1.0);
    shrink.toValue = @(0.1);
    shrink.duration = duration;
    shrink.repeatCount = MAXFLOAT;
    
    [dot addAnimation:shrink forKey:nil];
    
    
}
@end
