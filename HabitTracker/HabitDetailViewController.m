//
//  HabitDetailViewController.m
//  HabitTracker
//
//  Created by tstone10 on 6/3/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "HabitDetailViewController.h"
#import "HabitTableViewController.h"

@interface HabitDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton *markCompleteButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HabitDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_descriptionTextView.text = _selectedHabit.habitDescription;
	
	_imageView.image = _selectedHabit.habitImage;
	
	if(_selectedHabit.completed) {
		_markCompleteButton.backgroundColor = [UIColor redColor];
		[_markCompleteButton setTitle:@"Mark Incomplete" forState:UIControlStateNormal];
		[_markCompleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		//_markCompleteButton.titleLabel.textColor = [UIColor whiteColor];
		//_markCompleteButton.titleLabel.text = @"Mark Incomplete";
	}
	else {
		_markCompleteButton.backgroundColor = [UIColor greenColor];
		[_markCompleteButton setTitle:@"Mark Complete" forState:UIControlStateNormal];
		[_markCompleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		//_markCompleteButton.titleLabel.textColor = [UIColor blackColor];
		//_markCompleteButton.titleLabel.text = @"Mark Complete";
	}
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)completeButtonPressed:(id)sender {
	_selectedHabit.completed = _selectedHabit.completed ? NO : YES;
}

#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	
	
}*/

@end
