## Deploy Bonsai ( https://github.com/treecode/Bonsai ) visualisation - requirements: Running NVidia X, CUDA and NVidia-Docker on host 
<br>
Edit, create and deploy ThereminQ Bonsai visualisations

- docker run --gpus all -d -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -p 6080:6080 -v /run/user/1000/gdm/Xauthority:/root/.Xauthority -h $HOSTNAME twobombs/thereminq:bonsai 

- If you get an error similar to "Cannot connect to :0" please look at http://wiki.ros.org/docker/Tutorials/GUI $ xhost +local:root
- If you get an error similar to "Cannot compile shader" please select nvidia as your primary OpenGL source $ prime-select nvidia

![Screenshot from 2022-03-15 20-05-42](https://user-images.githubusercontent.com/12692227/158462197-9ed0bb66-cb50-4507-a4aa-58a001141386.png)


Images by ThereminQ's Tipsy visualisation scripts can be viewed and downloaded at https://github.com/twobombs/thereminq-graphs

![Screenshot_from_2021-09-25_08-52-34 (1)](https://user-images.githubusercontent.com/12692227/134770011-8db48546-4853-4735-a980-cfc866d1786f.png)
![Screenshot from 2021-11-10 14-01-38](https://user-images.githubusercontent.com/12692227/141146591-1f7a8684-bdab-4b43-92d0-0f262d44a5d8.png)
![Screenshot from 2021-11-10 14-01-38a](https://user-images.githubusercontent.com/12692227/141675948-cd953c5b-5bdc-4e67-82bd-649530596788.png)
