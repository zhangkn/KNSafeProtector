# KNSafeProtector


# 基本实现思路

* 使用runtime+ @try @catch @finally

```objc

/**
2019-03-11 17:39:59.637936+0800 KNSafeProtector[4546:1525728] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[__NSCFConstantString stringByAppendingString:]: nil argument'
*/
- (NSString *)safe_stringByAppendingString:(NSString *)aString
{
// 方案二：使用 try  catch 实现
NSString *subString = nil;
@try {
subString = [self safe_stringByAppendingString:aString];
}
@catch (NSException *exception) {
LSSafeProtectionCrashLog(exception,LSSafeProtectorCrashTypeNSStirng);
subString = self;
}
@finally {
return subString;
}

// 最原始的方案一：
//    if(aString == nil){
//        return self;
//    }
//    // 因为方法的实现已经交换了，因此执行safe_stringByAppendingString方法，本质之行的是stringByAppendingString的IMP
//    return [self safe_stringByAppendingString:aString];
}

```

# NSString 
 * 新增stringByAppendingString
