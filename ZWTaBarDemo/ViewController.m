//
//  ViewController.m
//  ZWTaBarDemo
//
//  Created by 崔先生的MacBook Pro on 2022/12/10.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    NSLog(@"FirstViewController");
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.center.x - 100, self.view.center.y - 100, 200, 50)];
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.placeholder = @"提问:你是谁?";
    _textField.returnKeyType = UIReturnKeyGo;
    [self.view addSubview:_textField];
    _textField.delegate = self;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.center.x - 35, _textField.frame.origin.y + 70, 70, 50)];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    _label.center = self.view.center;
    _label.text = @"回答错误";
    _label.textAlignment = NSTextAlignmentCenter;
    _label.hidden = YES;
    
}

- (void)btnAction {
    if ([_textField.text containsString:@"Z"] || [_textField.text containsString:@"W"]) {
        _label.text = @"回答正确";
        _label.hidden = NO;
    } else {
        _label.text = @"回答错误";
        _label.hidden = NO;
    }
    [self performSelector:@selector(hide) withObject:nil afterDelay:1.0];
    [self.view addSubview:_label];
    _label.backgroundColor = [UIColor whiteColor];
    
    [_textField resignFirstResponder];
    _textField.returnKeyType = UIReturnKeyGo;
}

- (void)hide {
    _label.hidden = YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self btnAction];
    [textField resignFirstResponder];
    return YES;
}


@end
