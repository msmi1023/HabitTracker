//
//  HabitTableViewController.m
//  HabitTracker
//
//  Created by tstone10 on 6/3/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "HabitTableViewController.h"
#import "HabitDetailViewController.h"
#import "Habit.h"

@interface HabitTableViewController ()

@end

NSMutableArray *habitArray;
NSIndexPath *selectedIndexPath;

@implementation HabitTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	[self populateHabitArray];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)populateHabitArray {
	Habit *habit1 = [[Habit alloc] initWithHabitTitle:@"Wake up" andDescription:@"Get out of bed!" andCompleted:YES andImage:@"wakeup"];
	Habit *habit2 = [[Habit alloc] initWithHabitTitle:@"Exercise" andDescription:@"Go to local gym, get swole" andCompleted:NO andImage:@"exercise"];
	Habit *habit3 = [[Habit alloc] initWithHabitTitle:@"Read" andDescription:@"Pick a book and get to it" andCompleted:NO andImage:@"read"];
	Habit *habit4 = [[Habit alloc] initWithHabitTitle:@"Rage code" andDescription:@"Bang on keys" andCompleted:YES andImage:@"ragecode"];
	
	habitArray = [[NSMutableArray alloc] initWithObjects:habit1, habit2, habit3, habit4, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return habitArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
	
	Habit *habit = habitArray[indexPath.row];
	
	if(habit.completed) {
		cell.backgroundColor = [UIColor greenColor];
		cell.textLabel.textColor = [UIColor blackColor];
		
		NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
		
		NSAttributedString* attrText = [[NSAttributedString alloc] initWithString:habit.title attributes:attributes];
		cell.textLabel.attributedText = attrText;
	}
	else {
		cell.backgroundColor = [UIColor redColor];
		cell.textLabel.textColor = [UIColor whiteColor];
		
		cell.textLabel.attributedText = nil;
		cell.textLabel.text = habit.title;
	}
	
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		[habitArray removeObjectAtIndex:indexPath.row];
		[tableView reloadData];
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	
	HabitDetailViewController *destController = (HabitDetailViewController*)[segue destinationViewController];
	selectedIndexPath = [self.tableView indexPathForSelectedRow];
	destController.selectedHabit = [habitArray objectAtIndex:selectedIndexPath.row];
}

- (IBAction)unwindToTable:(UIStoryboardSegue *)unwindSegue {
	HabitDetailViewController *srcController = [unwindSegue sourceViewController];
	
	[habitArray replaceObjectAtIndex:selectedIndexPath.row withObject:srcController.selectedHabit];
	[self.tableView reloadData];
}

@end
