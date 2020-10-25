# ClassManagementSystem
 一个扩展性极高的班级管理系统，主要用VBA写的
 
 至于其扩展性极高的原因，是由这个系统的结构决定的
 下面展示一下整个系统的结构
 

 CMS
 |___MAINCTRLBROAD
 |           |___MainControlBroad.exe (主控板)
 |           |___Path.pa (功能exe路径)
 |           |___startup.pa (跟随启动功能exe路径)
 |           |___ico
 |                |___...(功能图标)
 |
 |___CLOCK
 |      |___CLOCK.exe (时钟功能)
 |
 |___COURSEESHEET
 |      |___CS.txt  (课程表文本文件)
 |      |___COURSEESHEET.exe (课程表功能)
 |
 |___NAMELIST
 |      |___namelist1.txt , namelist2.txt ....(每组的值日生表文本文件)
 |      |___NAMELIST.exe (值日生表功能)      
 |      |___userjob.job (自定义职务文本文件)
 |      |___grpNo.gpn (记录当天的值日生组别)
 |      |___maxgrp.gpn (储存最大组别编号的文本文件)
 |      |___opendate.opd (记录打开的日期，由此决定是否在启动时切换到下一组)
 |
 |___HOMEWORKB
 |      |___history
 |      |       |___语文.bmp .... (布置的作业的历史记录，方便关机或退出exe后的重载)
 |      |___color.col (诶这是干嘛的我忘了。。。。)
 |      |___HOMEWORKBOARD.exe (用于新建和载入作业的控制面板)
 |      |___name.hkn (由面板生成，告诉dbroad.exe生成作业图片的文件名的文件)
 |      |___loadpath.pa (诶我又忘了，估摸是为了告诉picloader.exe去load哪门作业的图像的文件)
 |      |___picloader.exe (负责展示作业的exe)
 |      |___dbroad.exe (负责手写作业的简易画板)
 |
 |___SP   
 |    |___ScreenPainter.exe (屏幕画笔功能)
 |
 |___UDISKCHECKER
         |___UDISKCHECKER.exe (检测U盘插入并在插入后打开U盘的功能，好像有点bug)


### 可以看到，各个功能是分离的EXE
这样的结构可以很方便的像系统内添加功能，只要自己写一个exe，然后把路径和要在主控板上显示的图标(一般是jpg之类的图像，不用ico)加入到path.pa中然后重启主控板，新功能就会完成添加(显然主控板是用了动态的控件数组)

# 提示：可以看到Release文件夹里的主控板其对应的path.pa中，前四个功能使用了相对与CMS.exe的路径
# 原因是前四个功能写的不规范，这几个exe打开文件的时候都直接使用了相对于自己的路径
# 但是一旦被CMS.exe调用，他们的startup path就变成了CMS.exe所在的文件夹，于是会发生找不到文件的情况。
# 但是把这个路径写成相对于CMS.exe的就不会有这样的问题
