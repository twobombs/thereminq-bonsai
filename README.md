## Deploy Bonsai visualisation of Qrack output through containerization


Requirements: NVidia X, CUDA and NVidia-Docker2 on host 
<br>

Edit, creates and deploys ThereminQ data visualisations
```bash
docker run --gpus all -d -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -p 6080:6080 -v /run/user/1000/gdm/Xauthority:/root/.Xauthority -h $HOSTNAME twobombs/thereminq-bonsai 
````

- If you get an error similar to `"Cannot connect to :0"` please look at http://wiki.ros.org/docker/Tutorials/GUI `$ xhost +local:root`
- If you get a succesful initialisation followed by a coredump set `ulimit -c unlimited` 
- If you can't get NVidia GPU to render OpenGL with other GPU `apt install nvidia-prime` and set renderer to `prime-select nvidia`
- If you get an error similar to `"Cannot compile shader"` please select nvidia as your primary OpenGL source `prime-select nvidia`
- If you get a timeout on the import of large models ( > 3M particles ) follow [this](https://nvidia.custhelp.com/app/answers/detail/a_id/3029/~/using-cuda-and-x) guide
- If you want to import a smaller amount of particles due to VRAM limitations and/or performance issues use `--reducebodies=X` parameter

-----------

[BONSAI](https://github.com/treecode/Bonsai) thank you [Jeroen Bedorf](https://github.com/jbedorf)

[QRACK](https://github.com/vm6502q/qrack) thank you [Daniel Strano](https://github.com/WrathfulSpatula)

-----------

More bonsai images by ThereminQ's visualisation script can be viewed and downloaded [here](https://github.com/twobombs/thereminq-graphs)
![Screenshot from 2023-04-10 12-37-38](https://user-images.githubusercontent.com/12692227/230887892-1490ddb4-959c-45bb-98ac-28fe682f92a9.png)
![Screenshot from 2022-03-15 20-05-42](https://user-images.githubusercontent.com/12692227/158462197-9ed0bb66-cb50-4507-a4aa-58a001141386.png)
![Screenshot_from_2021-09-25_08-52-34 (1)](https://user-images.githubusercontent.com/12692227/134770011-8db48546-4853-4735-a980-cfc866d1786f.png)
![Screenshot from 2021-11-10 14-01-38](https://user-images.githubusercontent.com/12692227/141146591-1f7a8684-bdab-4b43-92d0-0f262d44a5d8.png)
![Screenshot from 2021-11-10 14-01-38a](https://user-images.githubusercontent.com/12692227/141675948-cd953c5b-5bdc-4e67-82bd-649530596788.png)
