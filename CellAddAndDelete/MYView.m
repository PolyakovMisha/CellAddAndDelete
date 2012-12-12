//
//  MYView.m
//  CellAddAndDelete
//
//  Created by svp on 08.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MYView.h"

@implementation MYView
@synthesize textName;
@synthesize str1;
//@synthesize myViewVC;
@synthesize delegate;


#pragma mark - View lifecycle

- (void)dealloc {
    [textName release];
    [str1 release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *button=[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(CancelName:)];
    self.navigationItem.leftBarButtonItem=button;
    [button release];
    [textName setDelegate:self];
    textName.keyboardType=UIKeyboardTypeDefault;
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)CancelName:(id)sender
{
    str1=nil;
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    str1=textField.text;
    NSLog(@"%@", str1);
   if (delegate)[delegate returnMyView];
    return  0;
}
    


@end
