//
//  MyViewController.m
//  Swift-Objc
//
//  Created by Yang Li on 2020/8/5.
//  Copyright © 2020 Yang Li. All rights reserved.
//

#import "MyViewController.h"
#import "Swift_Objc-Swift.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"ObjectiveC Page";
    self.view.backgroundColor = UIColor.whiteColor;
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 200, 50);
    label.backgroundColor = UIColor.whiteColor;
    label.text = @"ObjectiveC Page";
    [self.view addSubview:label];
    
    Person *p = [[Person alloc] initWithName:@"zhangsan" age: 20];
    NSLog(@"%@", p.name);
}

- (void) test1 {
    NSLog(@"%@", @"test1");
}

- (void) test2 {
    NSLog(@"%@", @"test2");
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
