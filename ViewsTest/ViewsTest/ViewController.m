//
//  ViewController.m
//  ViewsTest
//
//  Created by Nikolay Berlioz on 11.10.15.
//  Copyright © 2015 Nikolay Berlioz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 200, 50)];
    view1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 130, 50, 250)];
    view2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.8];
    
    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight |
                             UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    //расстояние от ее левой, правой стороны, от верха и низа не будет меняться при повороте, а сама вьюха растянется
    //и тут в общем много вариаций подробнее в видео Алексея приблизительно 27 минут
    [self.view addSubview:view2];
    
    self.testView = view2;
    
    [self.view bringSubviewToFront: view1]; //так view1 встанет в массиве вьюх первее view2
    
    
}

- (UIInterfaceOrientationMask) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    //NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.testView.frame), NSStringFromCGRect(self.testView.bounds));
    NSLog(@"\nframe = %@\nbounds = %@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.view.bounds));
    
    CGPoint origin = CGPointZero;
    origin = [self.view convertPoint:origin fromView:self.view.window];
    NSLog(@"origin = %@", NSStringFromCGPoint(origin));
    
    CGRect r = self.view.bounds;
    r.origin.y = 0;
    r.origin.x = CGRectGetWidth(r) - 100;
    r.size = CGSizeMake(100, 100);
    
    UIView *v = [[UIView alloc] initWithFrame:r];
    v.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:v];
}

@end
