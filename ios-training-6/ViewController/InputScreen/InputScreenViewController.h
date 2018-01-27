//
//  InputScreenViewController.h
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Memo.h"
@interface InputScreenViewController : UIViewController

+ (InputScreenViewController*)setupInputScreen;
@property (strong, nonatomic) Memo *memo;
@end
