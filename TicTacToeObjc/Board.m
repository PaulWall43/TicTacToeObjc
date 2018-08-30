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
        self.board = [NSMutableArray arrayWithCapacity:3];
        self.board[0] = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1]];
        self.board[1] = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1]];
        self.board[2] = [NSMutableArray arrayWithArray:@[@-1, @-1, @-1]];
    }
    return self;
}

///Checks if you can legally make a move in that position
-(BOOL) canMakeMoveAt:(int)x andY:(int)y {
    //TODO: Make sure board is never of size 0
    if (x >= _board[0].count || y >= _board.count) {return NO;}
    NSNumber *empty = @-1;
    if ([_board[y][x] intValue] != [empty intValue]) {return NO;}
    return YES;
}

///Makes move regardless of valid or not
-(BOOL) makeMove:(int)player withX:(int)x withY:(int)y {
    _board[y][x] = [NSNumber numberWithInt:player];
    return [self checkWin];
}

///Return true if win
-(BOOL) checkWin {
    //Check horizontal
    for(int i = 0; i < _board.count; i++) {
        int curr = [_board[i][0] intValue];
        for (int j = 1; j < _board[i].count; j++) {
            if (curr == [_board[i][j] intValue] && curr != -1) {
                if (j == _board[i].count - 1) {
                    return YES;
                } else {curr = [_board[i][j] intValue];}
            } else {break;}
        }
    }
    
    //Check vertical
    for(int i = 0; i < _board[0].count; i++) {
        long curr = [_board[0][i] integerValue];
        for(int j = 1; j < _board.count; j++) {
            if (curr == [_board[j][i] intValue] && curr != -1) {
                if (j == _board.count - 1) {
                    return YES;
                } else {curr = [_board[j][i] intValue];}
            } else {break;}
        }
    }
    
    //Check diagonal
    int curr = [_board[0][0] intValue];
    for (int i = 1, j = 1; i < _board[0].count && j < _board.count; i++,j++) {
        if (curr == [_board[j][i] intValue] && curr != -1) {
            if (j == _board.count - 1) {
                return YES;
            } else {curr = [_board[j][i] intValue];}
        } else {break;}
    }
    
    long rightX = _board[0].count - 1;
    curr = [_board[0][rightX] intValue];
    for (long i = rightX-1, j = 1; i >= 0 && j < _board.count; i--,j++) {
        if (curr == [_board[j][i] intValue] && curr != -1) {
            if (j == _board.count - 1) {
                return YES;
            } else {curr = [_board[j][i] intValue];}
        } else {break;}
    }
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
