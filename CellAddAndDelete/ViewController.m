//
//  ViewController.m
//  CellAddAndDelete
//
//  Created by svp on 08.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

//@synthesize cellInsert;
@synthesize myArray;
//@synthesize cellDelete;
@synthesize myTable;
//@synthesize insName;


#pragma mark - View lifecycle

- (void)dealloc {
    
    [myArray release];
    [cellDelete release];
    [cellInsert release];
    [insName release];
    [str release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     myArray=[[NSMutableArray alloc] initWithObjects:@"Misha",@"Sasha", nil];
   
}

#pragma mark - creat myTable

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

#pragma mark - audit editStyle

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


#pragma mark - MoveRow

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

#pragma mark - InsertRow

-(void) openMyView
{
    insName=[[MYView alloc]initWithNibName:nil bundle:nil];
    insName.delegate=self;
    [self.navigationController pushViewController:insName animated:YES];    
}

-(void)returnMyView
{
    str=insName.str1;
    if ([str length]!=0){
        [self.myArray addObject:str];
        [self.myTable reloadData];
        [self.navigationController popViewControllerAnimated:YES];
        //  return NO;
    }
    [self.navigationController popViewControllerAnimated:YES];
    //return NO;
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

#pragma mark - DeleteRow

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

@end
