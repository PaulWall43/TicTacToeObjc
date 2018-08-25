//
//  Board.m
//  TicTacToeObjc
//
//  Created by Paul Wallace on 8/23/18.
//  Copyright © 2018 Paul Wallace. All rights reserved.
//

#import "Board.h"

@implementation Board

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.board = @[@[@-1, @-1, @-1],@[@-1, @-1, @-1],@[@-1, @-1, @-1]];
    }
    return self;
}

-(BOOL) canMakeMoveAt:(int)x andY:(int)y {
    
    return NO;
}

-(BOOL) makeMove:(int)player withX:(int)x withY:(int)y {
    //Check point on board
    
    
    return NO;
}

-(BOOL) checkWin {
    return NO;
}

+(instancetype) boardOfSize:(int)size {
    Board * board = [[Board alloc] init];
    if (self) {
        board.board = nil;
    }
    return board;
}

@end
