//
//  ViewController.m
//  DMGesturedNavigationController
//
//  Created by Thomas Ricouard on 04/05/13.
//  Copyright (c) 2013 Thomas Ricouard. All rights reserved.
//

#import "ViewController.h"
#import "WithinNavigationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onBarbuttonItem)];
    self.navigationItem.rightBarButtonItem = item;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)onBarbuttonItem
{
   [self.gesturedNavigationController.parentViewController dismissViewControllerAnimated:YES completion:^{
       
   }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)childViewControllerdidBecomeActive
{
    NSLog(@"View Controller %d: Became active", [self stackOffset]);
}

- (void)childViewControllerdidResignActive
{
    NSLog(@"View Controller %d: Resigned active", [self stackOffset]);
}

- (void)childViewControllerdidShow
{
    NSLog(@"View Controller %d: Did show", [self stackOffset]);
        self.title = [NSString stringWithFormat:@"VC: %d", [self stackOffset]];
}

- (void)childViewControllerdidHide
{
    NSLog(@"View Controller %d: Became active", [self stackOffset]);
}

- (void)childViewControllerCouldBecomeActive
{
      NSLog(@"View Controller %d: Could become active", [self stackOffset]);
    //Good idea to customize transition
    /*
    [UIView animateWithDuration:0.30 animations:^{
        [self.view setAlpha:1.0];
    }];
     */
}

- (void)childViewControllerCouldBecomeInactive
{
    NSLog(@"View Controller %d: Could become innactive", [self stackOffset]);
    /*
    [UIView animateWithDuration:0.30 animations:^{
        [self.view setAlpha:0.50];
    }];
     */
}

- (IBAction)onPushNewVC:(id)sender {
    ViewController *controller = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    [controller.view setBackgroundColor:[UIColor darkGrayColor]];
    [self.gesturedNavigationController pushViewController:controller animated:YES];
}

- (IBAction)pushVC:(id)sender {
    
    WithinNavigationViewController *vc = [[WithinNavigationViewController alloc]initWithNibName:nil bundle:nil];
    [self.gesturedNavigationController.navigationController pushViewController:vc animated:YES];
}
@end
