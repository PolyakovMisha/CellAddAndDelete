//
//  MYView.h
//  CellAddAndDelete
//
//  Created by svp on 08.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"


@interface MYView : UIViewController <UITextFieldDelegate>
{
  //  NSString *str1;
  //  ViewController *myViewVC;
}

@property (retain, nonatomic) IBOutlet UITextField *textName;
@property (retain, nonatomic) ViewController *myViewVC;

@property (retain, nonatomic) NSString *str1;

-(IBAction)CancelName:(id)sender;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
//- (void)textFieldDidEndEditing:(UITextField *)textField;
-(id)initWithViewController:(ViewController*)myViewController;
+(id)creatMyView:(ViewController*)singleController;
 

//-(id) init;

@end
