# JXLSegmentControl
自定义方便使用的分段选择器

# 用法
- 用Frame创建

```objc
JXLSegmentControl *segmentControl = [[JXLSegmentControl alloc]initWithTitles:titlesArray frame:frame];
[self.view addSubview:segmentControl];
```

- 用Size创建(这个默认坐标就是(0,0))

```objc
JXLSegmentControl *segmentControl = [[JXLSegmentControl alloc]initWithTitles:titleArray size:size];
[self.view addSubview:segmentControl];
```
- 监听点击事件(用block回调)

```objc
[segmentControl segmentChangedWithIndex:^(NSInteger index) {
        //code here
}];
```


