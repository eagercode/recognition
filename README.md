## Recognition
Object recognition using OpenCV

Docker image url: https://hub.docker.com/r/eagercode/recognition/

## Run Container
```docker run -itd eagercode/recognition:3.1.0```

With name: 
```docker run -itd --name=recognition eagercode/recognition:3.1.0```

With volume (windows directory ```C:/recognition``` mapped with container ```/tmp``` directory): 
```docker run -itd -v C:/recognition:/tmp eagercode/recognition:3.1.0```

## Examples
Put ```examples/image_recognition``` into volume directory (e.g. ```C:/recognition```)

Cat face recognition command: 
```docker exec -it recognition python3.5 /tmp/detect.py --cascade /tmp/haarcascade_frontalcatface.xml --image /tmp/images/02.jpg```

Result images will be put into recognition volume
