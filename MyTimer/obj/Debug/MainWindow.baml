   M S B A M L   `   `   `  ����B  >MyTimer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:MyTimerMyTimer  5   	       MyTimer.MainWindow   5   	   V RMaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:MyTimer     5   	   \ XHardcodet.Wpf.TaskbarNotification, Version=1.0.5.0, Culture=neutral, PublicKeyToken=null)tb http://www.hardcodet.net/taskbar  5   	   -   5           MaterialDesignBody#���   5   	   $��Regular"�5   	   $��32(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignPaper#���  5   	     MaterialDesignFont#���  5	   	    � Title$ Pomodoro��5   	   $	��350��6   $	��600��6'    � Icon$( "/Images/TrayIcons/pomodoro_ico.ico��5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $��75 �6   �� 5      $	��110 �6   �� 5      $	��180 �6   �� 5      $
��auto �6   $��589.512��6,    � RowDefinitions 5   
   �� 5      $��20 �6   �� 5      $
��auto �6   $��76��6*   �� 5      $
��auto �6   $��49��6*   �� 5       �� 5!      $��20 �6   .+�5$   
   �� -   5         ��Name$ 
TimerLabel��5$      $��25:00��6$   $��2��64   $��Center=�6A   $��Center=�6^   $��182.5��6�   $��0,1.532,635.745,141.936q�6�   $��2��6�   $��2��6�   $��2��6�   �� 5&   
   -   5        $��	RunButton��5&   )   $	��Run��6:   $��3��6H   $��52.5,39.244,45.685,72.624q�6U   $��Center=�6x   $��Center=�6�   $
��Auto��6�   $��81.815��6�   $��2��6�   �� 5(   
   -   5        $��ResetButton��5(   +   $��Reset��6>   $��3��6N   $��17.5,39.244,10.685,72.624q�6[   $��Center=�6~   $��Center=�6�   $
��Auto��6�   $��81.815��6�    J� RenderTransformOrigin$ -0.546,0.62&�6�   $��1��6   �� 5*   
   -   5        $��
StopButton��5*   *   $
��Stop��6<   $��3��6K   $"��43.784,39.244,512.645,72.624q�6X   $��Center=�6~   $��Center=�6�   $
��Auto��6�   $��81.816��6�   $��3��6�   �� 5+   
   $��14(�6   $
��Bold"�6    $��Nbr of times��62   $��75,42.068,479.512,7.332q�6F   $��3��6g   $��1��6w   �� 5,   
   -   5        $ RestCounter��5,      $��14(�6%   $��-��63   $��Center=�6?   $��Center=�6\   $
��15.6��6�   $ 2.979,0.446&�6�   $��110,0,512.645,141.936q�6�   $��3��6�   $��2��6�   $��2��6�   �� 5-   
   -   5        $ 	RestLabel��5-      $
��Rest��6#   $��Center=�62   $��Center=�6O   $��150.748��6s   $��Disabled=�6�   $��11.867,15,17.385,0q�6�   $��1��6�   $��2��6�   3  -Hardcodet.Wpf.TaskbarNotification.TaskbarIcon  5/   
   -   5          Name$ 
notifyIcon��5/      $y�Visible=�50      	   MenuActivation$	 LeftOrRightClick=�52      
   
IconSource$(
 "/Images/TrayIcons/pomodoro_ico.ico��53         PopupActivation$ DoubleClick=�54      $��2��63   $��0,0,34.512,0q�6G      ToolTipText 51      ��  �� ElementName$ 
MainWindow�� �� Path$ currentTimeForToolTip�   TrayToolTip 55      �� 56      
����ح�
�����_�$��2q�59       �� CornerRadius$ 4��5:       J� Opacity$	 0.8Q�5;      $	��160��5<      $��40��5=      ._�5>      �� -	   5         ��Name$ CurrentTimeTextBlock��5?      $��Center=�5A      $��Center=�5B      ��5@      �� $ 
TimerLabel��$ .�5B      5D      5F      �� 5G   
   $��10,5,0,16.532q�6   $,��&Images/TrayIcons/pomodoro_KFo_icon.ico��6'   $
��Fill=�6W   $ 1.615,0.462&�6f   $��1��6�   5H      5L      