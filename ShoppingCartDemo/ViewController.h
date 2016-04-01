//
//  ViewController.h
//  ShoppingCartDemo
//
//  Created by Zhangping on 16/4/1.
//  Copyright (c) 2016年 zp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *iv_cart;
@property (weak, nonatomic) IBOutlet UIButton *ib_add;
@property (nonatomic,strong) UIBezierPath *path;

@end
