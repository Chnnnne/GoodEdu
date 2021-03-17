# 教务管理系统
**基于JavaWeb技术**
1. 主要有学生端、教师端
2. MVC框架
3. 基本功能有成绩查询、选课、教材订购、以及录入成绩等等
4. 拥有简洁且不简单的前端设计
5. 初次尝试，代码有部分冗余，还有很多可有优化的地方，欢迎交流qq：952668425


**以下是该系统的特点**

（一）功能完备、界面精美的登录界面
  采用JS、CSS、Html技术，登录界面的前端动画十分美观，而且设置有验证码验证功能（利用Servlet、Session技术实现），还有十分钟内记住登录状态（利用Cookie技术实现），此外还有注册功能，方便游客访问该系统。
 ![image](https://user-images.githubusercontent.com/63045769/111068778-252d7980-8505-11eb-804e-1d82d68ff819.png)



（二）精心完备的数据库设计
数据库的设计、表的创建确实下了很大一部分功夫，表的数量达到了十个，而且整个数据库表结构十分清晰，而且约束关系也比较完备，此外还设置了很多数据库基本对象比如索引、视图、触发器、存储过程等。
 ![image](https://user-images.githubusercontent.com/63045769/111068954-c7e5f800-8505-11eb-9a9f-e2cc489f54a7.png)



（三）功能十分完备
1）学生端的功能有查看个人基本信息、成绩查询、选课系统、教材订购系统，资料下载功能等等。
2）教师端的功能有查看个人基本信息、课程评分查看、所有学生成绩查看，学生成绩个性化分析、录入分数功能等等。
3）管理端可以及时查看所有学生的订书情况，从而快速的采取一些行动。

![image](https://user-images.githubusercontent.com/63045769/111411563-bf640c00-8715-11eb-9b6e-8f22b463083e.png)
![image](https://user-images.githubusercontent.com/63045769/111413061-80838580-8718-11eb-8961-290b14735485.png style="zoom:67%;")




（四）精美的前端组件
采用Twitter提供的BootStrap框架制作了精美的前端组件如轮播图、导航条、表单、表格、按钮、图片等等一些交互组件，让整个系统的前端十分简约、美观。
![image](https://user-images.githubusercontent.com/63045769/111413089-942eec00-8718-11eb-864e-a7f462586aa9.png style="zoom:70%;")




（五）成熟的数据库访问技术
采用Spring家族中比较成熟的JDBCTemplate技术，配合阿里巴巴公司的Druid连接池技术，让整个数据库访问过程十分便捷、快速、安全，而且其各种方法可以将查询的结果封装成JavaBean配合EL表达式方便展示。



（六）整体架构清晰
采用成熟的MVC架构设计模式，Model（模型）接收视图发出的请求，并返回处理结果，Model（模型） 表现为业务对象后端系统，用于从数据库系统中存取信息，一个 Model（模型）能 为多个视图提供数据，所以减少了代码的重复性。View（视图）代表用户交互界 面，能为应用程序处理很多不同的视图，较少含有业务逻辑，MVC 将输入数据传 递给 Model 组件，并显示处理结果。Controller（控制器）接收用户通过视图发出 的请求，Controller（控制器）决定调用哪个模型构件去处理请求，连接模型与视图，并决定哪个视图来展示结果。
![image](https://user-images.githubusercontent.com/63045769/111412942-474b1580-8718-11eb-9664-1616233f9313.png)



 
（七）成熟的前端展示技术
采用JSP+Servlet+EL表达式+JSTL标签技术，再配合上JDBCTemplate封装的JavaBean、List等对象，让前端展示十分简洁、高效。此外还用了Echarts技术，让数据以图表的方式展示出来如下所示，十分直观。

![image](https://user-images.githubusercontent.com/63045769/111412877-2c78a100-8718-11eb-8df8-4ed7fe3c9ec2.png)
![image](https://user-images.githubusercontent.com/63045769/111412895-31d5eb80-8718-11eb-9739-331482bb47f5.png)


