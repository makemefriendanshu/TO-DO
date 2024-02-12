import cv2
import cvlib as cv

img = cv2.imread("lib/todo-0.1.0/priv/python_scripts/photo.jpg")
boxes, labels, _conf = cv.detect_common_objects(img, model="yolov3")

print(labels, boxes)

