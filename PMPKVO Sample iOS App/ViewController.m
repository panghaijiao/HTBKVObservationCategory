//
//  ViewController.m
//  HTBKVO Sample iOS App
//
//  Created by Mark Aufflick on 11/12/12.
//  Copyright (c) 2012 The High Technology Bureau. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+HTBKVObservation.h"

@interface ViewController ()

@property (strong) NSString *KVOPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self observe:self keyPath:@"KVOPath" options:NSKeyValueObservingOptionNew callback:^(HTBKVObservation *observation, NSDictionary *changeDictionary) {
        NSLog(@"%@", changeDictionary[@"new"]);
    }];
}

- (IBAction)rerunTests:(id)sender {
    self.KVOPath = @"olinone.com";
}

@end
