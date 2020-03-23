//
//  ViewController.m
//  CQLinedTextView
//
//  Created by 刘超群 on 2020/3/20.
//  Copyright © 2020 chaoqun. All rights reserved.
//

#import "ViewController.h"
#import "CQLinedTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CQLinedTextView *textView = [[CQLinedTextView alloc] initWithFrame:CGRectMake(0, 70, 300, 500)];
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.linedColor = UIColor.redColor;
    [self.view addSubview:textView];
}


@end
