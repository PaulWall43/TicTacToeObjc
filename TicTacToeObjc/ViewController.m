//
//  ViewController.m
//  TicTacToeObjc
//
//  Created by Paul Wallace on 8/23/18.
//  Copyright © 2018 Paul Wallace. All rights reserved.
//

#import "ViewController.h"
#import "Board.h"
@interface ViewController ()
@property Board* board;
@property int playerTurn;
-(void) buttonTapped:(int)x andY:(int)y;
@end

@implementation ViewController

//TODO: Look up synthesizing
- (void)viewDidLoad {
    [super viewDidLoad];
    //create board object
    _board = [[Board alloc] init];
    _playerTurn = 1;
}

-(void) buttonTapped:(int)x andY:(int)y fromButton:(UIButton *)button{
    if([_board canMakeMoveAt:x andY:y]) {
        BOOL didWin = [_board makeMove:_playerTurn withX:x withY:y];
        
        NSLog(didWin ? @"Yes" : @"No");
        [button setTitle:_playerTurn == 1 ? @"X": @"O" forState:UIControlStateNormal];
        _playerTurn = _playerTurn == 1 ? 0 : 1;
    }
}

- (IBAction)button1Tapped:(id)sender {
    [self buttonTapped:0 andY:0 fromButton:sender];
}
- (IBAction)button2Tapped:(id)sender {
    [self buttonTapped:1 andY:0 fromButton:sender];
}
- (IBAction)button3Tapped:(id)sender {
    [self buttonTapped:2 andY:0 fromButton:sender];
}
- (IBAction)button4Tapped:(id)sender {
    [self buttonTapped:0 andY:1 fromButton:sender];
}
- (IBAction)button5Tapped:(id)sender {
    [self buttonTapped:1 andY:1 fromButton:sender];
}
- (IBAction)button6Tapped:(id)sender {
    [self buttonTapped:2 andY:1 fromButton:sender];
}
- (IBAction)button7Tapped:(id)sender {
    [self buttonTapped:0 andY:2 fromButton:sender];
}
- (IBAction)button8Tapped:(id)sender {
    [self buttonTapped:1 andY:2 fromButton:sender];
}
- (IBAction)button9Tapped:(id)sender {
    [self buttonTapped:2 andY:2 fromButton:sender];
}

@end
