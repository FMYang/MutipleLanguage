//
//  LanguageSettingViewController.m
//  MutipleLanguage
//
//  Created by yfm on 2020/1/10.
//  Copyright © 2020 yfm. All rights reserved.
//

#import "LanguageSettingViewController.h"

@interface LanguageSettingViewController ()  <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *languages;
@property (nonatomic, copy) NSString *selectedLanguage;
@end

@implementation LanguageSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    self.languages = @[@"zh-Hans", @"en", @"fr"];
}

- (void)viewWillAppear:(BOOL)animated {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:kCameraLocal(@"Save") style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)saveAction {
    LanguageManager.shared.curLanguage = self.selectedLanguage;
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.languages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.languages[indexPath.row];
    if(self.languages[indexPath.row] == LanguageManager.shared.curLanguage) {
        cell.backgroundColor = UIColor.yellowColor;
    } else {
        cell.backgroundColor = UIColor.whiteColor;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedLanguage = self.languages[indexPath.row];
}


@end
