  

### HTBKVObservation的一点功能扩展，版权归原作者所有，原文查看

https://github.com/thehtb/HTBKVObservation

扩展使用方法

```
[self observe:self keyPath:@"KVOPath" options:NSKeyValueObservingOptionNew callback:^(HTBKVObservation *observation, NSDictionary *changeDictionary) {
   // to do
}];
```

有兴趣可以看看这篇文章

http://www.olinone.com/?p=232
