//
//  HabitDetailViewController.h
//  HabitTracker
//
//  Created by tstone10 on 6/3/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Habit.h"

@interface HabitDetailViewController : UIViewController

@property (nonatomic, strong) Habit *selectedHabit;

@end
