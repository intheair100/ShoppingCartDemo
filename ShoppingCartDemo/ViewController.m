//
//  ViewController.m
//  ShoppingCartDemo
//
//  Created by Zhangping on 16/4/1.
//  Copyright (c) 2016年 zp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer* layer;
    UILabel* cntLabel;
    NSInteger cnt;
    UIImageView* imageView;
    UIButton* btn;
}
@end

@implementation ViewController
@synthesize ib_add,iv_cart,path;

- (void)viewDidLoad {
    [super viewDidLoad];
    cnt = 0;
    
    [ib_add addTarget:self action:@selector(addThingToCart) forControlEvents:UIControlEventTouchUpInside ];
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 150)];
    [path addQuadCurveToPoint:CGPointMake(iv_cart.frame.origin.x + iv_cart.frame.size.width / 2.0, iv_cart.frame.origin.y + iv_cart.frame.size.height / 2.0) controlPoint:CGPointMake(150, 20)];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addThingToCart
{
    if (!layer) {
        btn.enabled = NO;
        layer =[CALayer layer];
        layer.contents =  (__bridge id)[UIImage imageNamed:@"thing.png"].CGImage;
        layer.contentsGravity = kCAGravityResizeAspectFill;
        layer.bounds = CGRectMake(0, 0, 50, 50);
        layer.cornerRadius = CGRectGetHeight(layer.bounds)/2;
        layer.masksToBounds= YES;
        layer.position = CGPointMake(50, 150);
        [self.view.layer addSublayer:layer];
        
 
    }
    [self addAnimation];
}

-(void)addAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expandAnimation.duration = 0.5f;
    expandAnimation.fromValue = [NSNumber numberWithFloat:1];
    expandAnimation.toValue = [NSNumber numberWithFloat:2.0f];
    expandAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *narrowAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    narrowAnimation.beginTime = 0.5;
    narrowAnimation.fromValue = [NSNumber numberWithFloat:2.0f];
    narrowAnimation.duration = 1.5f;
    narrowAnimation.toValue = [NSNumber numberWithFloat:0.5f];
    
    narrowAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,expandAnimation,narrowAnimation];
    groups.duration = 2.0f;
    groups.removedOnCompletion=NO;
    groups.fillMode=kCAFillModeForwards;
    groups.delegate = self;
    [layer addAnimation:groups forKey:@"group"];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
