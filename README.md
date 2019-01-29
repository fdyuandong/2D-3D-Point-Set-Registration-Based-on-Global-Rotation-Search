# 2D-3D Point Set Registration Based on Global Rotation Search
 Copyright (C) 2018 Yinlong Liu@outlook.com

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 Any publications resulting from the use of this code should cite the
 following paper:
 Yinlong Liu, Yuan Dong, Zhijian Song and Manning Wang, "2D 3D Point Set Registration Based on Global Rotation_Search", IEEE Transactions on Image Processing (TIP) 


==================Note=================

1. First step->open demo_rot.m. It is a demo of Rotation Search in SO(3) for 2D-3D point set registration.

2. The input data is set to a real circumstance that 3D point set is far away for projection plane, and in front of camera.  Our method also can be applied to unusual condition that camera is surrounded by 3D point set, only if you make some fix. 

3. RotaionSearch.m is the kernel of algorithm. You can easily extend it to SE(3) searching by grid-search, while tuning parameters depends on your tasks.

4. Fast and Global 2D-3D point set registration without correspondence is still an open problem and need further explorations. I am very happy that if you could benefit from our code.


 Author: Yinlong Liu
 Date: 20181218
 Revision: 1.0
