//
//  Habit.h
//  HabitTracker
//
//  Created by tstone10 on 6/3/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Habit : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *habitDescription;
@property (nonatomic) BOOL completed;
@property (nonatomic, strong) UIImage *habitImage;

-(id) initWithHabitTitle:(NSString *)title andDescription:(NSString *)description andCompleted:(BOOL)compeleted andImage:(NSString *)imageString;

@end

