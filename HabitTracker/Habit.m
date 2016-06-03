//
//  Habit.m
//  HabitTracker
//
//  Created by tstone10 on 6/3/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "Habit.h"

@implementation Habit

-(id) initWithHabitTitle:(NSString *)title andDescription:(NSString *)description andCompleted:(BOOL)compeleted andImage:(NSString *)imageString{
	self = [super init];
	
	if(self) {
		_title = title;
		_habitDescription = description;
		_completed = compeleted;
		_habitImage = [UIImage imageNamed:imageString];
	}
	
	return self;
}

@end
