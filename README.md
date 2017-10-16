## Recognition
Object recognition using OpenCV

Docker image: https://hub.docker.com/r/eagercode/recognition/

Run container: docker run -itd eagercode/recognition
With name: docker run -itd --name=recognition eagercode/recognition
With volume (windows directory "C:/recognition" mapped with container "/tmp" directory): docker run -itd -v C:/recognition:/tmp eagercode/recognition

Put examples/image recognition into volume directory (C:/recognition)
Cat face recognition command: docker exec -it recognition python3.5 /tmp/detect.py --cascade /tmp/haarcascade_frontalcatface.xml --image /tmp/images/02.jpg
Result image will be put into recognition volume
