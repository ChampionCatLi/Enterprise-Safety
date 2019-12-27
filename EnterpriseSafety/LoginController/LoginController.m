//
//  LoginController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/13.
//  Copyright © 2019 chao. All rights reserved.
//

#import "LoginController.h"
#import "TYAttributedLabel.h"
#import <WMZDialog.h>
#import "MainTabBar.h"

@interface LoginController ()<TYAttributedLabelDelegate,UITextFieldDelegate>


@property (nonatomic,strong) UIImageView * topIconImageView;
/**
 账号
 */
@property(nonatomic,strong) UIView * accountItem;
@property(nonatomic,strong) UIImageView * accountIcon ;
@property(nonatomic,strong) UITextField * accountField;
/**
 机构
 */
@property(nonatomic,strong) UIView * organItem;
@property(nonatomic,strong) UIImageView * organIcon;
@property(nonatomic,strong) UITextField * organField;

/**
 密码
 */
@property(nonatomic,strong) UIView * passwordItem;
@property(nonatomic,strong) UIImageView * passwordIcon;
@property(nonatomic,strong) UITextField * passwordField;

@property(nonatomic,strong) UIButton * loginButton;

@property(nonatomic,strong) UILabel * companyNameLabel;

@property(nonatomic,strong) UIView * gayLineAccount;
@property(nonatomic,strong) UIView * gayLineOrgan;
@property(nonatomic,strong) UIView * gayLinePassword;

@property(nonatomic,copy) NSString * accountStr;
@property(nonatomic,copy) NSString * passwordStr;

@property(nonatomic,strong)NSArray * organDataArr;
@property(nonatomic,strong)NSMutableArray * organNameArr;
/**
 assign 基础数据类型
 */
@property(nonatomic,assign) NSInteger  selectIndex;
/**
 协议
 */
@property(nonatomic,strong) TYAttributedLabel * agreementLinkText;



#define TAG_ACCOUNT 0x000000001
#define TAG_PASSWORD 0x000000002
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
}

#pragma mark -init view -
-(void) initView{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:self.topIconImageView];
    [self.view addSubview:self.accountItem];
    [self.accountItem addSubview:self.accountIcon];
    [_accountIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.accountItem.mas_centerY);
        make.left.equalTo(@5);
        make.size.equalTo(@25);
    }];
    [self.accountItem addSubview:self.accountField];
    [_accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountIcon.mas_right).offset(15);
        make.width.equalTo(self.accountItem.mas_width).offset(-35);
        make.centerY.equalTo(self.accountItem.mas_centerY);
    }];
    [self.accountItem addSubview:self.gayLineAccount];
    [_gayLineAccount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.accountItem.mas_bottom);
        make.width.equalTo(self.accountItem.mas_width);
        make.height.equalTo(@0.5);
        make.centerX.equalTo(self.accountItem.mas_centerX);
    }];
    
    [self.view addSubview:self.organItem];
    [_organItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountItem.mas_bottom);
        make.width.equalTo(@(SCREEN_WIDTH-50));
        make.height.equalTo(@55);
        make.left.equalTo(@25);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [self.organItem addSubview:self.organIcon];
    [_organIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.organItem.mas_centerY);
        make.left.equalTo(@5);
        make.size.equalTo(@25);
    }];
    
    [self.organItem addSubview:self.organField];
    [_organField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.organIcon.mas_right).offset(15);
        make.size.equalTo(self.accountField);
        make.centerY.equalTo(self.organItem.mas_centerY);
        
    }];
    
    [self.organItem addSubview:self.gayLineOrgan];
    [_gayLineOrgan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.gayLineAccount);
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.organItem.mas_bottom);
        
    }];
    //
    [self.view addSubview:self.passwordItem];
    
    [_passwordItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH-50));
        make.height.equalTo(@55);
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.accountItem.mas_bottom);
    }];
    [self.passwordItem addSubview:self.passwordIcon];
    [_passwordIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@25);
        make.left.equalTo(@5);
        make.centerY.equalTo(self.passwordItem.mas_centerY);
        
    }];
    
    [self.passwordItem addSubview:self.passwordField];
    [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordItem.mas_centerY);
        make.left.equalTo(self.passwordIcon.mas_right).offset(15);
        //        make.right.equalTo(@SCREEN_WIDTH).offset(-15);
        make.size.equalTo(self.accountField);
        
    }];
    [self.passwordItem addSubview:self.gayLinePassword];
    [_gayLinePassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.gayLineAccount);
        make.centerX.equalTo(self.view.mas_centerX);
        make.left.equalTo(@25);
        make.bottom.equalTo(self.passwordItem.mas_bottom);
        
    }];
    
    [self.view addSubview:self.loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordItem.mas_bottom).offset(40);
        make.height.equalTo(@50);
        make.left.equalTo(@25);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    [self.view addSubview:self.companyNameLabel];
    [_companyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-25);
        make.centerX.equalTo(self.view.mas_centerX);
        
    }];
    [self.view addSubview: self.agreementLinkText];
    [_agreementLinkText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@20);
        make.width.equalTo(@205);
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.companyNameLabel.mas_top).offset(-20);
        
    }];
    
    
    
    
}

-(UILabel * ) companyNameLabel {
    
    
    if (_companyNameLabel==nil) {
        _companyNameLabel=[[UILabel alloc] init];
        _companyNameLabel.text=@"© 北京通安信息技术有限公司版权所有";
        _companyNameLabel.font=[UIFont systemFontOfSize:11];
        _companyNameLabel.textColor=LCBlack333333;
    }
    
    return  _companyNameLabel;
}

-(TYAttributedLabel *) agreementLinkText{
    
    if (_agreementLinkText==nil) {
        _agreementLinkText=[[TYAttributedLabel alloc] init];
        _agreementLinkText.characterSpacing=0;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"登录即代表您同意"];
        [attributedString addAttributeTextColor:[UIColor colorWithWhite:97/255.0 alpha:1] ];
        [attributedString addAttributeFont:[UIFont systemFontOfSize:12]];
        [_agreementLinkText appendTextAttributedString:attributedString];
        
        [_agreementLinkText appendLinkWithText:@"用户协议" linkFont:[UIFont systemFontOfSize:12] linkColor:[UIColor blueColor] linkData:@"用户协议"];
        NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc]initWithString:@"和"];
        [attributedString2 addAttributeFont:[UIFont systemFontOfSize:12]];
        [attributedString2 addAttributeTextColor:[UIColor colorWithWhite:97/255.0 alpha:1] ];
        
        [_agreementLinkText appendTextAttributedString:attributedString2];
        [_agreementLinkText appendLinkWithText:@"隐私协议" linkFont:[UIFont systemFontOfSize:12]   linkColor:[UIColor blueColor] linkData:@"隐私协议"];
        [_agreementLinkText sizeToFit];
        _agreementLinkText.textAlignment=NSTextAlignmentLeft;
    }
    return _agreementLinkText;
}




#pragma mark - topIcon
-(UIImageView *) topIconImageView{
    if (_topIconImageView==nil) {
        UIImage * image=[UIImage imageNamed:@"logo.png"];
        _topIconImageView=[[UIImageView alloc] initWithImage:image];
        _topIconImageView.frame=CGRectMake(0, 0, 60, 60);
        _topIconImageView.center=CGPointMake(SCREEN_WIDTH*0.5, 70);
    }
    
    return _topIconImageView;
    
    
}


#pragma mark - account -

-(UIView *) accountItem {
    if (_accountItem==nil) {
        _accountItem =[[UIView alloc] initWithFrame:CGRectMake(25, self.topIconImageView.frame.origin.y+100, SCREEN_WIDTH-50, 50)];
        _accountItem.backgroundColor=[UIColor whiteColor];
        
    }
    return _accountItem;
}

-(UIImageView *) accountIcon {
    
    
    if (_accountIcon==nil) {
        UIImage * image=[UIImage imageNamed:@"user.png"];
        _accountIcon=[[UIImageView alloc]initWithImage:image];
    }
    
    return _accountIcon;
}

-(UITextField *) accountField{
    
    if (_accountField==nil) {
        _accountField=[[UITextField alloc]init];
        _accountField.textAlignment=NSTextAlignmentLeft;
        _accountField.clearButtonMode =UITextFieldViewModeAlways;
        _accountField.keyboardType=UIKeyboardTypeNumberPad;
        _accountField.placeholder=@"请输入账号";
        _accountField.borderStyle=UITextBorderStyleNone;
        _accountField.tag=TAG_ACCOUNT;
        [_accountField addTarget:self action:@selector(fieldChangeText:) forControlEvents:UIControlEventEditingChanged];
    }
    
    return _accountField;
}

#pragma mark - organ  layout -

-(UIView  *)organItem{
    if (_organItem == nil) {
        _organItem = [[UIView alloc]init];
        _organItem.backgroundColor=[UIColor whiteColor];
        _organItem.hidden=YES;
        _organItem.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(organItemOnclick)];
        [_organItem addGestureRecognizer:tap];
    }
    return _organItem;
    
}
-(UIImageView *)organIcon{
    if (_organIcon==nil) {
        UIImage * image=[UIImage imageNamed:@"work.png"];
        _organIcon=[[UIImageView alloc] initWithImage:image];
    }
    
    return _organIcon;
}

-(UITextField *) organField{
    if (_organField==nil) {
        _organField=[[UITextField alloc] init];
        _organField.placeholder=@"请选择机构";
        _organField.textAlignment=NSTextAlignmentLeft;
        _organField.enabled=false;
        _organField.borderStyle=UITextBorderStyleNone;
        _organField.delegate=self;
        [_organField addTarget:self action:@selector(fieldChangeText:) forControlEvents:UIControlEventEditingDidEnd];
    }
    return _organField;
}


#pragma mark - password layout -
-(UIView *) passwordItem{
    
    
    if (_passwordItem==nil) {
        _passwordItem=[[UIView alloc] init];
        _passwordItem.backgroundColor=[UIColor whiteColor];
    }
    
    return _passwordItem;
}

-(UIImageView *) passwordIcon{
    if (_passwordIcon==nil) {
        UIImage * image= [UIImage imageNamed:@"lock.png"];
        _passwordIcon=[[UIImageView alloc] initWithImage:image];
    }
    
    return _passwordIcon;
}

-(UITextField *) passwordField{
    if (_passwordField==nil) {
        _passwordField=[[UITextField alloc] init];
        _passwordField.placeholder=@"请输入密码";
        _passwordField.textAlignment=NSTextAlignmentLeft;
        _passwordField.borderStyle=UITextBorderStyleNone;
        _passwordField.clearButtonMode=UITextFieldViewModeAlways;
        _passwordField.secureTextEntry=YES;
        [_passwordField addTarget:self action:@selector(fieldChangeText:) forControlEvents:UIControlEventEditingChanged];
        _passwordField.tag=TAG_PASSWORD;
    }
    return _passwordField;
}


#pragma mark -bottom  layout -
-(UIButton *) loginButton{
    
    if (_loginButton==nil) {
        _loginButton=[[UIButton alloc] init];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.backgroundColor=[UIColor whiteColor];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector( loginClick:) forControlEvents:UIControlEventTouchUpInside];
        [_loginButton.layer setMasksToBounds:YES];
        [_loginButton.layer setCornerRadius:5];
        _loginButton.backgroundColor=LCButtonUnclickColor;
    }
    
    return  _loginButton;
    
}


#pragma mark - init line -

-(UIView *) gayLineAccount{
    if (_gayLineAccount==nil) {
        _gayLineAccount=[[UIView alloc] init];
        _gayLineAccount.backgroundColor=LCGayLineBDBDBD;
        
    }
    return _gayLineAccount;
}
-(UIView *) gayLineOrgan{
    if (_gayLineOrgan==nil) {
        _gayLineOrgan=[[UIView alloc] init];
        _gayLineOrgan.backgroundColor=LCGayLineBDBDBD;
        
    }
    return _gayLineOrgan;
}
-(UIView *) gayLinePassword{
    if (_gayLinePassword==nil) {
        _gayLinePassword=[[UIView alloc] init];
        _gayLinePassword.backgroundColor=LCGayLineBDBDBD;
        
    }
    return _gayLinePassword;
}

#pragma mark - onclick -

-(void)attributedLabel:(TYAttributedLabel *)attributedLabel textStorageClicked:(id<TYTextStorageProtocol>)textStorage atPoint:(CGPoint)point
{
    
    
    if([textStorage isKindOfClass:[TYLinkTextStorage class]])
    {
        NSString *linkStr = ((TYLinkTextStorage*)textStorage).linkData;
        NSLog(@"hahahahh %@",linkStr);
        
    }}
-(void) loginClick:(UIButton *)button{
    [self go2Login];
}

#pragma mark -listener  method-

-(void)fieldChangeText:(UITextField *)textField{
    if (textField.tag==TAG_ACCOUNT) {
        _accountStr=textField.text;
    }else if(textField.tag==TAG_PASSWORD){
        _passwordStr=textField.text;
    }
    if (self.accountStr.length!=0&&[self isPhoneNum:_accountStr]) {
        //todo
        [self getOrganInfo];
    }else{
        [self hideOrganLayout];
    }
    
    [self checkData];
}

-(void) organItemOnclick{
    [self showDialog];
}

#pragma mark - network -

-(void)getOrganInfo{
    [XMCenter  sendRequest:^(XMRequest * _Nonnull request) {
        request.api=[url_get_account_organ stringByAppendingString:self.accountStr];
        request.httpMethod=kXMHTTPMethodGET;
    } onSuccess:^(id  _Nullable responseObject) {
        NSArray * keys=  [responseObject allKeys];
        if ( [keys containsObject:@"message"]) {
            self.organDataArr=responseObject[@"message"];
            if (self.organDataArr.count>1) {
                [self showOrganLayout];
                self.organNameArr= [[NSMutableArray alloc] init];
                for (NSDictionary  * dic in self.organDataArr) {
                    [self.organNameArr addObject:dic[@"name"]];
                }
            }else{
                [self hideOrganLayout];
            }
            
        }else{
            [self hideOrganLayout];
        }
        
    } onFailure:^(NSError * _Nullable error) {
        NSLog(@"error");
    } ];
}

-(void) go2Login{
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url_do_login_by_password;
        NSDictionary * organDic=self.organDataArr[self.selectIndex];
        id tenantId=organDic[@"tenantId"];
        id orgId =organDic[@"orgId"];
        request.parameters=@{@"tid":tenantId,@"orgid":orgId,@"username":self.accountStr,@"password":self.passwordStr};
    } onSuccess:^(id  _Nullable responseObject) {
        NSUserDefaults * defaults =[NSUserDefaults standardUserDefaults];

        NSDictionary * messageDic =responseObject[@"message"];
        [defaults setObject:responseObject[data_key_user_jse_id] forKey:data_key_user_jse_id];
        [defaults setObject:messageDic[data_key_user_id] forKey:data_key_user_id];
        [defaults setObject:messageDic[data_key_user_name] forKey:data_key_user_name];
        [defaults setObject:messageDic[data_key_user_token] forKey:data_key_user_token];
        [defaults setObject:messageDic[data_key_user_fee_modle] forKey:data_key_user_fee_modle];
        
        [defaults synchronize];
     
//        NSUserDefaults * userdata=[NSUserDefaults standardUserDefaults];
//        NSString * token =[userdata objectForKey:data_key_user_token];
//        NSString * feeModel=[userdata objectForKey:data_key_user_fee_modle];
//        NSLog(@"token::  %@ feeModel::: %@",token,feeModel);
        [self go2MainActivity];
        } onFailure:^(NSError * _Nullable error) {
            NSLog(@"%@",error);
        }];
        
    }
#pragma mark - 判断手机号是否合法 -
     - (BOOL)isPhoneNum:(NSString *)phoneNum
    {
        //正则表达式
        NSString *moble = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
        NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", moble];
        return [regextestcm evaluateWithObject:phoneNum];
        
    }
     
#pragma mark - reset ui -
     
     -(void)showOrganLayout{
        self.organItem.hidden=NO;
        [_passwordItem mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.organItem.mas_bottom);
            make.width.equalTo(@(SCREEN_WIDTH-50));
            make.height.equalTo(@55);
            make.centerX.equalTo(self.view.mas_centerX);
            
        }];
    }
     -(void) hideOrganLayout{
        self.organItem.hidden=YES;
        self.organField.text=@"";
        [_passwordItem mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(SCREEN_WIDTH-50));
            make.height.equalTo(@55);
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.equalTo(self.accountItem.mas_bottom);
        }];
        
    }
     
#pragma mark -other  method-
     
     -(void) showDialog{
        Dialog().wTypeSet(DialogTypeSelect) .wEventFinishSet(^(id anyID, NSIndexPath *path, DialogType type) {
            
            [self setOrganIndex:path.item setOrganName:anyID];
            
        }).wTitleSet(@"").wMessageSet(@"请选择一项")
        .wDataSet(self.organNameArr).wMultipleSelectionSet(NO).wStart();
    }
     
     -(void) setOrganIndex:(NSInteger)index setOrganName:(NSString *)organNameStr{
        self.organField.text=organNameStr;
        self.selectIndex=index;
        [self checkData];
    }
     
     -(void) checkData{
        if(self.accountStr.length!=0&&self.passwordStr.length!=0&&self.organField.text.length!=0) {
            if ([self isPhoneNum:self.accountStr]) {
                self.loginButton.enabled=YES;
                [_loginButton setBackgroundColor:LCButtonclickColor];
            }else{
                self.loginButton.enabled=NO;
                [_loginButton setBackgroundColor:LCButtonUnclickColor];
            }
        }else{
            self.loginButton.enabled=NO;
            [_loginButton setBackgroundColor:LCButtonUnclickColor];
        }
    }
     

-(void) go2MainActivity{
    MainTabBar * mainTabBar=[[MainTabBar alloc] init];
    mainTabBar.modalPresentationStyle=UIModalPresentationFullScreen;
    [self presentViewController:mainTabBar animated:NO completion:NULL];
    
}
     @end
