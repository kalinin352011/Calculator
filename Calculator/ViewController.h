//
//  ViewController.h
//  Calculator
//
//  Created by tim on 12.10.15.
//  Copyright © 2015 tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSString *saveNumber;
@property NSInteger action;
@property BOOL currentNumber;
@property (weak, nonatomic) IBOutlet UILabel *field;

typedef enum : NSUInteger {
    CalculatorActPlus,
    CalculatorActMinus,
    CalculatorActDivide,
    CalculatorActMult,
    CalculatorActNone
} CalculatorAct;

- (NSString *)firstNumber;
- (NSString *)enters:(long)number;
- (void)act:(NSInteger)action;

@end

