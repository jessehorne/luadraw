Lua Draw
========

Lua Draw was inspired by Logo. I wanted to create a graphical application that took in input from a file, and created a visual representation from it. 

Requirements
------------
[LÖVE](http://love2d.org/)

How to Use
----------
```
touch example.ldraw
echo "f 50" > example.ldraw
love . example.ldraw
```

Functions
---------
```
f arg
	Goes forward arg steps
b arg
	Goes backward arg steps
r arg
	Rotates arg degrees
```