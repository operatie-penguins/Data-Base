   M S B A M L   `   `   `  ����>  :KIS, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:KISKIS  5   	       KIS.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   !localclr-namespace:KIS    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5          � Title$  
MainWindow��5   	    � SizeToContent$ WidthAndHeight=�6    � WindowStartupLocation$ CenterScreen=�6;    � 
ResizeMode$ NoResize=�6w    � 	Resources 5         KIS.MuConverter   MuConverter   KIS.MuConverter2  MuConverter2��%:   &	        &	        5   
   62     5	   
   64   5
      .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   o� -   5        $��menuMain��5   0   $��0��6   $��4��6   .@�5      m� $��Файл��6   m� 5      $��Правка��6   .@�5      m� -   5        $��
menuDelete��5   F   $��Удалить ��6   6Z   5      m� 5      $��Инструменты��6   .@�5      m� -   5        $��Добавить план��5      6K   m� 5      -   5        $%��Добавить продукт��5      6P   m� 5       -   5        $(��"Добавить компанию ��5       6R   m� 5!      -   5        $8��2Добавить план для компаний ��5!      6[   5"      5$      �� 5%   
   -   5        $��listViewPlans��5%   1   $��0��6   $��2��6#   ��6F   ��  �� View 5&      �� 5'      P�5(      �� 5)      $��Название��6)    �� DisplayMemberBinding 5*      �� 	 �� Path$
	 Name��� 5+      $��Начало��6)    5,      �� $	 	DateStart��� 5-      $��
Конец��6)    5.      �� $	 DateEnd�50      52      �� 53   
   -	   5        $��listViewAllItems��53   0   $��1��6   $��2��6#    54      �� 55      P�56      �� 57      $��Название��6)    6;   �� $	 Item1��� 59      $��Количество��6)    6=   �� $	 Item2�5;      5=      �� 5?   
   -
   5        $��listViewProducts��5?   0   $��2��6   $��2��6#   
 � DataContext
 6H   ��  �� ElementName$ listViewPlans����6z   �� $ 	 SelectedItem.ProductsLists� 5@      �� 5A      P�5B      �� 5C      $��Название��6)    5D      �� $	 Product1.Name��� 5E      $��Количество��6)    5F      �� $	 ProductsNumber�5H      5J      �� 5K   
   -   5        $��listViewItems��5K   0   $��3��6   $��2��6#   
 6E   �� $ listViewProducts����6z   �� $&	  SelectedItem.Product1.Structures� 5L      �� 5M      P�5N      �� 5O      $��Название��6)    5P      �� $	 
Item1.Name��� 5Q      $��Количество��6)    5R      �� $	 ItemsNumber�5T      5V      �� 5W   
   $��0��6   $��1��6    $��Center=�6-   .��6Q   
Планы5X      �� 5Y   
   $��1��6   $��1��6    $��Center=�6-   .��6Q   Создать6Z   �� 5Z   
   $��2��6   $��1��6    $��Center=�6-   .��6Q   Продукты6[   �� 5[   
   $��3��6   $��1��6    $��Center=�6-   .��6Q   Детали6Y   5\      5]      