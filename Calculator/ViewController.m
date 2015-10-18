//
//  ViewController.m
//  Calculator
//
//  Created by tim on 12.10.15.
//  Copyright © 2015 tim. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.action = CalculatorActNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)one:(id)sender {
    self.field.text = [self enters:1];
}

- (IBAction)two:(id)sender {
    self.field.text = [self enters:2];
}

- (IBAction)three:(id)sender {
    self.field.text = [self enters:3];
}

- (IBAction)four:(id)sender {
    self.field.text = [self enters:4];
}

- (IBAction)five:(id)sender {
    self.field.text = [self enters:5];
}

- (IBAction)six:(id)sender {
    self.field.text = [self enters:6];
}

- (IBAction)seven:(id)sender {
    self.field.text = [self enters:7];
}

- (IBAction)eight:(id)sender {
    self.field.text = [self enters:8];
}

- (IBAction)nine:(id)sender {
    self.field.text = [self enters:9];
}

- (IBAction)zero:(id)sender {
    self.field.text = [self enters:0];
}

- (IBAction)plus:(id)sender {
    [self act:CalculatorActPlus];
}

- (IBAction)minus:(id)sender {
    [self act:CalculatorActMinus];
}

- (IBAction)multiplication:(id)sender {
    [self act:CalculatorActMult];
}

- (IBAction)division:(id)sender {
    [self act:CalculatorActDivide];
}

- (IBAction)equal:(id)sender {
    switch (self.action) {
        case CalculatorActPlus:
            self.field.text = [NSString stringWithFormat:@"%lld", [self.saveNumber longLongValue] + [self.field.text longLongValue]];
            self.action = CalculatorActNone;
            break;
        case CalculatorActMinus:
            self.field.text = [NSString stringWithFormat:@"%lld", [self.saveNumber longLongValue] - [self.field.text longLongValue]];
            self.action = CalculatorActNone;
            break;
        case CalculatorActMult:
            self.field.text = [NSString stringWithFormat:@"%lld", [self.saveNumber longLongValue] * [self.field.text longLongValue]];
            self.action = CalculatorActNone;
            break;
        case CalculatorActDivide:
            self.field.text = ![self.field.text isEqualToString:@"0"] ? [NSString stringWithFormat:@"%lld", [self.saveNumber longLongValue] / [self.field.text longLongValue]] : @"infinity";
            self.action = CalculatorActNone;
            break;
        default:
            break;
    }
}

- (IBAction)wipeOff:(id)sender {
    self.field.text = self.field.text.length == 1 ? @"0" : [self.field.text substringWithRange:NSMakeRange(0, self.field.text.length - 1)];
}

- (NSString *)firstNumber {
    return ((self.field.text.length == 1 && [self.field.text isEqualToString:@"0"]) || [self.field.text isEqualToString:@"infinity"]) ? @"" : self.field.text;
}

- (NSString *)enters:(long)number {
    self.field.text = self.firstNumber;
    return self.field.text.length < 12 ? self.field.text = [NSString stringWithFormat:@"%@%ld", self.field.text, number] : self.field.text;
}

- (void)act:(NSInteger)action {
    if (self.action == CalculatorActNone) {
        self.action = action;
        self.currentNumber = YES;
        self.saveNumber = self.field.text;
        self.field.text = @"0";
    }
}

@end
