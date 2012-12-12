//
//  ViewController.h
//  CellAddAndDelete
//
//  Created by svp on 08.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYView.h"
#import "AppDelegate.h"

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,MyTextFieldProtocol>
{
    NSInteger editStyle;
    NSMutableArray *myArray;
    NSString *str;
    MYView *insName;
    IBOutlet UIButton *cellInsert;
    IBOutlet UIButton *cellDelete;
    
}
//@property (retain, nonatomic) MYView *insName;

@property (retain, nonatomic) NSMutableArray *myArray;
@property (retain, nonatomic) IBOutlet UITableView *myTable;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

-(IBAction)delName:(id)sender;
-(IBAction)InsName:(id)sender;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)returnMyView;
-(void) openMyView;

@end
