//
//  SSCheckBoxViewViewController.m
//  SSCheckBoxView
//
//  Created by Ahmet Ardal on 12/6/11.
//  Copyright 2011 SpinningSphere Labs. All rights reserved.
//

#import "SSCheckBoxViewViewController.h"
#import "SSCheckBoxView.h"
#import "UIHelpers.h"

@implementation SSCheckBoxViewViewController

@synthesize checkboxes;

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma -
#pragma mark View lifecycle

- (void) checkBoxViewChangedState:(SSCheckBoxView *)cbv
{
    NSLog(@"checkBoxViewChangedState: %d", cbv.checked);
    [UIHelpers showAlertWithTitle:@"CheckBox State Changed"
                              msg:[NSString stringWithFormat:@"checkBoxView state: %d", cbv.checked]];
}

- (void) viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *a = [[NSMutableArray alloc] initWithCapacity:10];
    self.checkboxes = a;

    SSCheckBoxView *cbv = nil;
    CGRect frame = CGRectMake(20, 20, 240, 30);
    for (int i = 0; i < 10; ++i) {
        SSCheckBoxViewStyle style = (i % kSSCheckBoxViewStylesCount);
        BOOL checked = (i < 5);
        cbv = [[SSCheckBoxView alloc] initWithFrame:frame
                                              style:style
                                            checked:checked];
        [cbv setText:[NSString stringWithFormat:@"Option #%02d", (i + 1)]];
        [self.view addSubview:cbv];
        [self.checkboxes addObject:cbv];
        frame.origin.y += 36;
    }

    frame.origin.y += 24;
    cbv = [[SSCheckBoxView alloc] initWithFrame:frame
                                          style:kSSCheckBoxViewStyleGlossy
                                        checked:YES];
    [cbv setText:@"Some other item"];
    [cbv setStateChangedTarget:self
                      selector:@selector(checkBoxViewChangedState:)];
    [self.view addSubview:cbv];
}

- (void) viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
