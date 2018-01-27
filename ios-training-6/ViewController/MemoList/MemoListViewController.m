//
//  MemoListViewController.m
//  ios-training-6
//
//  Created by Manami Ichikawa on 2017/12/16.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

//ViewController
#import "MemoListViewController.h"
#import "InputScreenViewController.h"
//Model
#import "MemoDao.h"
#import "Memo.h"
#import "MemoListToolbar.h"
//View
#import "MemoDataProvider.h"
//Category
#import "UIViewController+Storyboard.h"


@interface MemoListViewController ()<UITableViewDelegate,DeleteMemoDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *numberOfMemosToolBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addOrDeleteAllToolBarButton;

@property (strong, nonatomic) MemoDataProvider *provider;
@property (strong, nonatomic) MemoDao *dao;
@property (nonatomic) BOOL isEditing;

- (IBAction)tapMemoButton:(id)sender;

@end

@implementation MemoListViewController

static NSString *const CellIdentifer = @"MemoCell";
#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:CellIdentifer bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CellIdentifer];
    [self setupNaviTitle];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.dao = [[MemoDao alloc]init];
    [self setupTableView];
    [self reloadToolBar];
}

#pragma mark -private

- (void)setupNaviTitle {
    self.navigationItem.title = NSLocalizedString(@"memo", @"メモ");
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setupTableView];
}

- (void)setupTableView{
    
    self.provider = [MemoDataProvider new];
    self.provider.delegate = self;
    self.tableView.dataSource = self.provider;
    self.tableView.delegate = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.provider.items = [self.dao showMemoList];
}

- (void)reloadToolBar{
    
    NSInteger memoCount = [self.dao showMemoList].count;
    self.numberOfMemosToolBarButton.title = [MemoListToolbar rightToolbarButtonTitle:memoCount];
    self.addOrDeleteAllToolBarButton.title = [MemoListToolbar leftToolbarButtonTitle:self.isEditing];
}

- (void)showAlertSheet{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"deleteAll", @"すべて削除")
                                                           style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [self.dao removeAllAtOnce];
                                                             [weakSelf deleteAll];
                                                             
                                                         }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", @"キャンセル")
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertController addAction:deleteAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}

- (void)deleteAll{
    
    [self.provider.items removeAllObjects];
    [self.tableView reloadData];
    [self reloadToolBar];
    
}

#pragma mark - actions

- (IBAction)tapMemoButton:(id)sender {
    
    if (self.isEditing){
        
        [self showAlertSheet];
    }else{
        InputScreenViewController *inputVC = [InputScreenViewController setupInputScreen];
    
        [self.navigationController pushViewController:inputVC animated:YES];
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    self.isEditing = !self.isEditing;
    [self reloadToolBar];
    self.tableView.editing = !self.tableView.isEditing;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray<Memo*>*items = [self.dao showMemoList];
    InputScreenViewController *inputVC = [InputScreenViewController setupInputScreen];
    inputVC.memo = items[indexPath.row];
    [self.navigationController pushViewController:inputVC animated:YES];
}

#pragma mark - DeleteMemoDelegate

- (void)didFinishDeleteMemo {
    [self reloadToolBar];
}







@end
