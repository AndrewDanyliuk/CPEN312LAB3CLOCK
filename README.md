# CPEN312LAB3CLOCK for DE0-CV Board
-hours:mins:seconds clock with 24hr/12hr modes
- SW9 HIGH -> 12 Hour Mode, LEDR9 will be lit if it's PM, else it's AM(unlit)
- SW9 LOW -> 24 Hour Mode
- INPUT 0-59 in binary with SW[5..0]  and press KEY0 to latch seconds, KEY1 to latch minutes
- INPUT 0-23 in binary with SW[5..0] and press KEY2 to latch hours
- Set SW8 High to load latched values onto counter and make low to begin counting from loaded values
- KEY3 will reset to 00:00:00

[![IMAGE ALT TEXT](http://img.youtube.com/vi/MLi5XLBwMiU/0.jpg)](http://www.youtube.com/watch?v=MLi5XLBwMiU "Clock Demonstration")
