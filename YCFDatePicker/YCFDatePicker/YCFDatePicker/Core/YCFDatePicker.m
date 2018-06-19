//
//  YCFDpCpnfig.h
//  Pods-YCFDatePicker_Example
//
//  Created by 岳昌锋 on 2018/6/19.
//

#import "YCFDatePicker.h"

#import "YCFDpCpnfig.h"

static CGFloat const YCFDp_Animation_Time = 0.25;
static CGFloat const YCFDp_Top_Height = 50.0;
static CGFloat const YCFDp_DatePicker_Height = 170.0;

typedef NS_ENUM(NSUInteger, YCFDp_CloseType) {
    YCFDp_CloseType_ClickCancel = 2000,
    YCFDp_CloseType_TapSelf,
    YCFDp_CloseType_ClickSure,
};

@interface YCFDatePicker ()<UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIView *viewAlert;

@property (strong, nonatomic) IBOutlet UIButton *btnCancel;

@property (strong, nonatomic) IBOutlet UIButton *btnSure;

@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UIView *topViewTopLine;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cstViewTopHeight;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *cstAlertViewHeight;

@property (nonatomic, strong) UIColor *topviewLineColor;

@end

@implementation YCFDatePicker


#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 生命周期
- (instancetype)init {
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        [self configBaseData];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        [self configBaseData];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //
    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    self.viewAlert.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height + [self getViewAlertHeight] / 2.0);
    
    [UIView animateWithDuration:YCFDp_Animation_Time animations:^{
        self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        self.viewAlert.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height - [self getViewAlertHeight] / 2.0);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self config];
}

- (void)config {
    [self configSelfView];
    [self configViewAlert];
    [self configBtn];
    
    [self updateAlertUI];
}

- (void)configSelfView {
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTapSelf)];
    tapG.delegate = self;
    [self.view addGestureRecognizer:tapG];
}

- (void)configViewAlert {
    self.viewAlert.backgroundColor = [UIColor whiteColor];
}

- (void)configBtn{
    self.btnCancel.backgroundColor = [UIColor whiteColor];
    self.btnSure.backgroundColor = [UIColor whiteColor];
    [self.btnCancel setTitleColor:self.normalColorCancelButton forState:(UIControlStateNormal)];
    [self.btnSure setTitleColor:self.normalColorSureButton forState:(UIControlStateNormal)];
}

- (void)configBaseData {
    self.isCanAutorotate = NO;
    self.isHasCancelAndSureButton = YES;
    self.normalColorCancelButton = [YCFDpCpnfig ycf_getDefaultBtnCancelColor];
    self.normalColorSureButton = [YCFDpCpnfig ycf_getDefaultBtnSureColor];
    self.fontButton = [YCFDpCpnfig ycf_getDefaultBtnFont];
    self.typeDatePicker = YCFDatePickerType_DateAndTime;
    self.datePickerCurrentDate = [NSDate date];
}

- (CGFloat)getViewAlertHeight {
    CGFloat topHeight = YCFDp_Top_Height;
    if (self.isHasCancelAndSureButton == NO) {
        topHeight = 0.0;
    }
    return topHeight + YCFDp_DatePicker_Height;
}

- (void)updateAlertUI {
    if (self.isHasCancelAndSureButton) {
        self.cstViewTopHeight.constant = YCFDp_Top_Height;
        self.btnCancel.hidden = NO;
        self.btnSure.hidden = NO;
    } else {
        self.cstViewTopHeight.constant = 0.5;
        self.btnCancel.hidden = YES;
        self.btnSure.hidden = YES;
    }
    
    self.cstAlertViewHeight.constant = [self getViewAlertHeight];
    
    [self.btnCancel setTitleColor:self.normalColorCancelButton forState:(UIControlStateNormal)];
    [self.btnSure setTitleColor:self.normalColorSureButton forState:(UIControlStateNormal)];
    self.btnCancel.titleLabel.font = self.fontButton;
    self.btnSure.titleLabel.font = self.fontButton;
    self.topViewTopLine.backgroundColor = self.topviewLineColor;
    //
    if (self.typeDatePicker == YCFDatePickerType_Date) {
        self.datePicker.datePickerMode = UIDatePickerModeDate;
    } else if (self.typeDatePicker == YCFDatePickerType_Time) {
        self.datePicker.datePickerMode = UIDatePickerModeTime;
    } else if (self.typeDatePicker == YCFDatePickerType_DateAndTime) {
        self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    }
    self.datePicker.date = self.datePickerCurrentDate;
    self.datePicker.minimumDate = self.dateMin;
    self.datePicker.maximumDate = self.dateMax;
}

- (void)actionTapSelf {
    [self close:YCFDp_CloseType_TapSelf];
}

- (IBAction)actionClickCancelBtn:(id)sender {
    [self close:YCFDp_CloseType_ClickCancel];
}

- (IBAction)actionClickSureBtn:(id)sender {
    [self close:YCFDp_CloseType_ClickSure];
}

- (void)showWithSourceVC:(UIViewController *)sourceVC completion:(void (^)(void))completion {
    [sourceVC presentViewController:self animated:NO completion:^{
        if (completion) {
            completion();
        }
    }];
}

- (void)close:(YCFDp_CloseType)closeType {
    [UIView animateWithDuration:YCFDp_Animation_Time animations:^{
        self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        self.viewAlert.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height + [self getViewAlertHeight] / 2.0);
    } completion:^(BOOL finished) {
        switch (closeType) {
            case YCFDp_CloseType_TapSelf:
            {
                if (self.isHasCancelAndSureButton == NO) {
                    [self handleActionallback];
                }
            }
                break;
                
            case YCFDp_CloseType_ClickCancel:
                break;
                
            case YCFDp_CloseType_ClickSure:
            {
                [self handleActionallback];
            }
                break;
                
            default:
                break;
        }
        
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)handleActionallback {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cdcvDateChooseView:chooseDate:)]) {
        [self.delegate cdcvDateChooseView:self chooseDate:self.datePicker.date];
    }
    
    if (self.blockChooseDate) {
        self.blockChooseDate(self.datePicker.date);
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint point = [touch locationInView:self.view];
    if (point.y > CGRectGetMinY(self.viewAlert.frame)) {
        //如果是点击弹出的内容视图, 拦截手势
        return NO;
    }
    return YES;
}

#pragma mark - setter & getter
- (UIColor *)topviewLineColor {
    return [YCFDpCpnfig ycf_getDefaultLineColor];
}

- (void)setIsHasCancelAndSureButton:(BOOL)isHasCancelAndSureButton {
    _isHasCancelAndSureButton = isHasCancelAndSureButton;
}

- (void)setTypeDatePicker:(YCFDatePickerType)typeDatePicker {
    _typeDatePicker = typeDatePicker;
}

- (void)setDatePickerCurrentDate:(NSDate *)datePickerCurrentDate {
    _datePickerCurrentDate = datePickerCurrentDate;
}

- (void)setDateMax:(NSDate *)dateMax {
    _dateMax = dateMax;
}

- (void)setDateMin:(NSDate *)dateMin {
    _dateMin = dateMin;
}

- (void)setNormalColorCancelButton:(UIColor *)normalColorCancelButton {
    _normalColorCancelButton = normalColorCancelButton;
}

- (void)setNormalColorSureButton:(UIColor *)normalColorSureButton {
    _normalColorSureButton = normalColorSureButton;
}

- (void)setFontButton:(UIFont *)fontButton {
    _fontButton = fontButton;
}

#pragma mark - 屏幕旋转
- (BOOL)shouldAutorotate {
    return self.isCanAutorotate;
}

@end

