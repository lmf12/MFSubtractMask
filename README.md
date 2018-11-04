# MFSubtractMask

一种实现 `UIView` 镂空效果的方案，可以快速实现任意形状的镂空、文字的镂空、带镂空的毛玻璃效果等。本质上是 `UIView` 的 `maskView` 效果的「取反」。

下面是最终实现的效果：
![](https://raw.githubusercontent.com/lmf12/MFSubtractMask/master/readme-image/demo.jpg)

可以很方便地生成毛玻璃的镂空效果:
![](https://raw.githubusercontent.com/lmf12/MFSubtractMask/master/readme-image/effect.jpg)

## 如何导入

#### 手动导入

将 MFSubtractMask 文件夹拖入工程中。

## 如何使用

#### 1. 引入头文件

```objc
#import "UIView+MFSubtractMask.h"
```

#### 2. 设置 `subtractMaskView` 属性

用法类似于 `UIView` 的 `maskView` 属性，但是能获得完全相反的效果。

```objc    
self.blackView.subtractMaskView = imageView;
```

## 局限性

#### 1. `subtractMaskView` 不会自动刷新

我们知道，当 `UIView` 的 `maskView` 的内容动态修改时，会实时反映到 `UIView` 中。但在本项目中， `subtractMaskView` 属性会生成一张全新的图片来作为遮罩图，因为不会根据 `subtractMaskView` 的内容实时来刷新视图。如果需要更新，必须手动调用 `setSubtractMaskView:` 方法来重新生成遮罩图。

#### 2. `setSubtractMaskView:` 不宜被频繁调用

 `setSubtractMaskView:` 本质上是生成一个新的遮罩图的过程，该过程涉及图片像素的遍历转换，较为耗时，不宜频繁调用。
 
 本项目更适合只生成一次遮罩图的场景。
