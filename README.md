# Table aligner

What is this?
------------
This is simple aligner for tables (useful for .features tables)

It transforms this

 |id |title     |body            |locale|status        |
|1  | Title1    |Lorem ipsum 1 ..|en    |ready, publish|
	|2 |Title2    |  Lorem ipsum 2 ..|en    |ready, publish  |
	|1 |   Заголовок1|Съешь еще этих..|ru    |ready, publish |

into this

|id|title     |body            |locale|status        |
|1 |Title1    |Lorem ipsum 1 ..|en    |ready, publish|
|2 |Title2    |Lorem ipsum 2 ..|en    |ready, publish|
|1 |Заголовок1|Съешь еще этих..|ru    |ready, publish|


Usage
-----------
Select region and type ttt

Installation
--------------
It requres ruby support compiled in vim. Just put it in your ~/.vim/bundle dir
