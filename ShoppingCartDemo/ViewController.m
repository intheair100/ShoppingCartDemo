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
    [path addQuadCurveToPoint:CGPointMake(270, 300) controlPoint:CGPointMake(150, 20)];
    
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
        layer.contents =  (__bridge id)[UIImage imageNamed:@"test01.jpg"].CGImage;
        layer.contentsGravity = kCAGravityResizeAspectFill;
        layer.bounds = CGRectMake(0, 0, 50, 50);
    }
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
