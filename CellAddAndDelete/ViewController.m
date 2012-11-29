//
//  ViewController.m
//  CellAddAndDelete
//
//  Created by svp on 08.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize cellInsert;
@synthesize myArray;
@synthesize cellDelete;
@synthesize myTable;
//@synthesize insName;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
     myArray=[[NSMutableArray alloc] initWithObjects:@"Misha",@"Sasha", nil];
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Name"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Name"];
    }
    cell.textLabel.text=[myArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [myArray removeObjectAtIndex:indexPath.row];
        [myTable deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    if (editingStyle==UITableViewCellEditingStyleInsert) {
       
        [self openMyView];
            }
}



- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editStyle==20) {
        return UITableViewCellEditingStyleDelete;
    }
   
    return UITableViewCellEditingStyleInsert;
   
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str1=[[myArray objectAtIndex:indexPath.row]retain];
    if ([str1 isEqual:@"Sasha"]||[str1 isEqual:@"Misha"]==YES) {
        return NO;
    }
    return YES;
}


-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
   // [myArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    NSString *str1=[[myArray objectAtIndex:sourceIndexPath.row]retain];
    [myArray removeObjectAtIndex:sourceIndexPath.row];
    [myArray insertObject:str1 atIndex:destinationIndexPath.row];
    [str1 release];
    
}



-(void) openMyView
{
    
    MYView *insName=[[MYView alloc]initWithViewController:self];//[MYView creatMyView:self];
    [self.navigationController pushViewController:insName animated:YES];

      
}



-(IBAction)delName:(id)sender
{
    if ([cellInsert.currentTitle isEqual:@"Done"]==YES) return;
    editStyle=20;
    if ([cellDelete.currentTitle isEqual:@"EditDelete"]==YES) {
        [cellDelete setTitle:@"Done" forState:UIControlStateNormal];
        [myTable setEditing:YES animated:YES]; 
    }else{
        [cellDelete setTitle:@"EditDelete" forState:UIControlStateNormal];
        [myTable setEditing:NO animated:YES];
            }
     
}

-(IBAction)InsName:(id)sender
{
    if ([cellDelete.currentTitle isEqual:@"Done"]==YES) return;
    editStyle=10;
    if ([cellInsert.currentTitle isEqual:@"EditInsert"]==YES) {
        [cellInsert setTitle:@"Done" forState:UIControlStateNormal];
        [myTable setEditing:YES animated:YES]; 
    }else{
        [cellInsert setTitle:@"EditInsert" forState:UIControlStateNormal];
        [myTable setEditing:NO animated:YES];
    }
 
}



- (void)dealloc {

    [myArray release];
    [cellDelete release];
    [cellInsert release];
  //  [insName release];
   [super dealloc];
}
- (void)viewDidUnload {
    [self setCellDelete:nil];
    [self setCellInsert:nil];
    [super viewDidUnload];
}
@end
