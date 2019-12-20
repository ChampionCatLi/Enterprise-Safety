//
//  Foundation+Log.m
//
//  Created by iOS  123 on 2019/8/5.
//  Copyright © 2019 123. All rights reserved.
//  控制台打印中文

@implementation NSDictionary (Log)
#ifdef DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level{
    
    NSMutableString *stringM = [NSMutableString string];
    [stringM appendString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [stringM appendFormat:@"\t%@ = %@;\n",key,obj];
    }];
    
    [stringM appendString:@"}\n"];
    
    return stringM;
}
#endif
@end

@implementation NSArray (Log)
#ifdef DEGUG
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level{
    
    NSMutableString *stringM = [NSMutableString string];
    [stringM appendString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [stringM appendFormat:@"\t%@,\n",obj];
    }];
    
    [stringM appendString:@")\n"];
    
    return stringM;
}
#endif
@end

@implementation UIView(Log)
#ifdef DEGUG
+ (NSString *)searchAllSubviews:(UIView *)superview
{
    NSMutableString *xml = [NSMutableString string];
    
    NSString *class = NSStringFromClass(superview.class);
    class = [class stringByReplacingOccurrencesOfString:@"_" withString:@""];
    [xml appendFormat:@"<%@ frame=\"%@\">\n", class, NSStringFromCGRect(superview.frame)];
    for (UIView *childView in superview.subviews) {
        NSString *subviewXml = [self searchAllSubviews:childView];
        [xml appendString:subviewXml];
    }
    [xml appendFormat:@"</%@>\n", class];
    return xml;
}

- (NSString *)description
{
    return [UIView searchAllSubviews:self];
}
#endif
@end
