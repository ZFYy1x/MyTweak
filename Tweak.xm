#import <UIKit/UIKit.h>
#import <roothide.h>  // 需要调用文件访问或路径转换时才用

%hook ZSLoginView

- (void)button_Login {
    NSLog(@"[MyTweak] 拦截 button_Login，直接跳转页面");

    Class VCClass = NSClassFromString(@"ViewController");
    if (!VCClass) {
        NSLog(@"[MyTweak] 找不到 ViewController 类，调用原方法");
        %orig;
        return;
    }
    UIViewController *vc = [[VCClass alloc] init];
    UINavigationController *nav = [self navigationController];
    if (nav) {
        [nav pushViewController:vc animated:YES];
        // 不调用原始登录流程，直接返回
        return;
    }
    NSLog(@"[MyTweak] navigationController为空，调用原方法");
    %orig;
}

%end
