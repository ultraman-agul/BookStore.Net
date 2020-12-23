# BookStore.Net

## 网上书店，ASP.NET，SQL Server

### 开发工具

+ SQL Server 2014
+ Visual Studio 2019Visual Studio Code
+ IIS服务
+ ASP.NET
+ C#
+ html 、css、 js



## 功能

本商城主要涉及到3中对象：游客（未登录）、商城注册用户、管理员。

游客（未登录）：可以登录、注册、商品查看，能在线浏览商城中已有的书籍。不能直接购买和添加到购物车。

商城注册用户：可以进行商品查看、添加商品到购物车、购物车管理、生成订单、订单管理、在线支付。实体书购买则需要通过添加购物车，设置收货地址，填写相关收货信息，确认一切无误后，生成订单再在线支付，等待图书管理员发货并以邮递的形式将实体书寄给用户。

管理员：可以添加商品、商品管理、查看订单。管理员可以添加新的书籍和将出售完的书籍下架，系统还需要统计一段时间内各类书籍网络版和实体版的出售数量，并建立榜单来吸引用户。



### 前台

![image.png](https://img.coolcr.cn/2020/12/23/014a16ae347ee.png)

### 后台

![image.png](https://img.coolcr.cn/2020/12/23/c0660cc78d7ff.png)

# 页面展示

## 主界面

![image.png](https://img.coolcr.cn/2020/12/23/7c0921daf29ed.png)



## 注册页

![image.png](https://img.coolcr.cn/2020/12/23/17f59f26bb11b.png)

## 留言

![image.png](https://img.coolcr.cn/2020/12/23/98602826a75a7.png)



## 书籍分类

![image-20201223175723223](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20201223175723223.png)

## 购物车

![image.png](https://img.coolcr.cn/2020/12/23/ece8d2a6b930d.png)

## 订单

![image-20201223175739571](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\image-20201223175739571.png)

## 上架

![image.png](https://img.coolcr.cn/2020/12/23/ac6a5560d77e2.png)

## 书籍管理

![image.png](https://img.coolcr.cn/2020/12/23/2ffd3306ca189.png)



> 看到这里了，点个star？
>
> 启动方式: sqlserver2014或以上版本附加AppData的数据库，修改App.config里的连接字符串和SqlHelper.cs内的构造方法的连接字符串。
