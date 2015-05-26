//
//  ViewController.m
//  JXLSegmentControlExample
//
//  Created by 金小白 on 15/5/26.
//  Copyright (c) 2015年 金小白. All rights reserved.
//

#import "ViewController.h"
#import "JXLSegmentControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *lable = [[UILabel alloc]init];
    lable.textColor = [UIColor blackColor];
    lable.text = @"首页";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:50];
    lable.frame = CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height - 40);
    [self.view addSubview:lable];
    
    JXLSegmentControl *segmentControl = [[JXLSegmentControl alloc]initWithTitles:@[@"首页",@"第二页",@"第三页",@"第四页"] size:CGSizeMake(self.view.frame.size.width,40)];
    [self.view addSubview:segmentControl];
    [segmentControl segmentChangedWithIndex:^(NSInteger index) {
        switch (index) {
            case 0:
                lable.text = @"首页";
                break;
            case 1:
                lable.text = @"第二页";
                break;
            case 2:
                lable.text = @"第三页";
                break;
            case 3:
                lable.text = @"第四页";
                break;
            default:
                break;
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}
@end
