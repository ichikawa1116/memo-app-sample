//
//  InputScreenViewController.m
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

//ViewController
#import "InputScreenViewController.h"
#import "UIViewController+Storyboard.h"
//Model
#import "MemoDao.h"
#import "Memo.h"
#import "MemoCellItemManager.h"

@interface InputScreenViewController ()

@property (nonatomic) BOOL isNewMemo;
@property (weak, nonatomic) IBOutlet UITextView *contentView;

- (IBAction)tapDoneButton:(id)sender;
- (IBAction)tapBackButton:(id)sender;

@end

@implementation InputScreenViewController


+ (InputScreenViewController*)setupInputScreen{
    
    InputScreenViewController *inputVC = (InputScreenViewController *)[InputScreenViewController initialViewControllerWithStoryboardName:@"InputScreen"];
    
    return inputVC;
}


#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self.contentView resignFirstResponder];
    
    if(self.memo){
        self.isNewMemo = NO;
        [self setupContentView];
    }else{
        self.memo = [[Memo alloc]init];
        self.isNewMemo = YES;
    }
}

#pragma mark -private

- (BOOL)checkText: (NSArray *)lines{
    
    BOOL isMultipleLines = (lines.count > 1)? YES : NO;
    return isMultipleLines;
}

- (void)setupContentView{
    
    NSString *text = self.memo.memoText;
    NSArray *rows = [MemoCellItemManager divideString:text];
    
    NSMutableString *savedMemo = [NSMutableString string];
    for (NSString *row in rows){
        
        [savedMemo appendFormat:@"%@\n",row];
    }
    
    self.contentView.text = [NSString stringWithFormat:@"%@\n%@",self.memo.memoTitle,savedMemo];
    
}


#pragma mark - action

- (IBAction)tapDoneButton:(id)sender {
    
    if (self.contentView.text.length == 0){
        return;
    }
    NSMutableArray *lines = [MemoCellItemManager sortRows:self.contentView.text];
    
    [lines removeObject:@""];
    self.memo.memoTitle = lines.firstObject;
    
    NSMutableString *text = [NSMutableString string];
    if ([self checkText:lines]){
        
        [lines removeObjectAtIndex:0];
        for (NSString *line in lines){
            [text appendFormat:@"%@ ",line];
        }
        self.memo.memoText = text;
        
    }else{
        
        self.memo.memoText = @"";
    }
    self.memo.memoDate  = [NSDate new];
    
    MemoDao *dao = [[MemoDao alloc]init];
    self.isNewMemo ? [dao addNewMemo:self.memo] : [dao updateMemo:self.memo];
    [self.navigationController popViewControllerAnimated:YES];

}


- (IBAction)tapBackButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
