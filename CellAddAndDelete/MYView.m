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
@synthesize myViewVC;


#pragma mark - View lifecycle

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

-(id)initWithViewController:(ViewController*)myViewController
{
    str1=@"";
    myViewVC=myViewController;
    return  self;
}

+(id)creatMyView:(ViewController*)singleController
{
    MYView *singleClass=[[MYView alloc]initWithViewController:singleController];
    return singleClass;
}

-(id) init;
{
    self=[super init];
    if(self){
        str1=@"";
    }
    return self;
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
  //  goto insertlabel;
    if ([str1 length]!=0){
        [myViewVC.myArray addObject:str1];
        [myViewVC.myTable reloadData];//     [myArray addObject:strMyView.str1];
        //    [strMyView release];
        //    [myTable reloadData];
        [self.navigationController popViewControllerAnimated:YES];
        return NO;
    }
    [self.navigationController popViewControllerAnimated:YES];
    return NO;
}

/*- (void)textFieldDidEndEditing:(UITextField *)textField
{
    str1=textField.text;
    [self.navigationController popViewControllerAnimated:YES];
    
}
*/
- (void)dealloc {
    [textName release];
    [str1 release];
    [super dealloc];
}
@end
