import os
from struct import unpack, pack
import numpy
import cv2, sys
import json
from struct import unpack, pack
import cvlib

# setup of FD 3 for input (instead of stdin)
# FD 4 for output (instead of stdout)
def setup_io():
    return os.fdopen(3,"rb"), os.fdopen(4,"wb")

UUID4_SIZE = 16

def read_message(input_f):
    # reading the first 4 bytes with the length of the data
    # the other 16 bytes are the UUID bytes
    # the rest is the image

    header = input_f.read(4)
    if len(header) != 4: 
        return None # EOF
    
    (total_msg_size,) = unpack("!I", header)

    # image id
    image_id = input_f.read(UUID4_SIZE)
    
    # read image data
    image_data = input_f.read(total_msg_size - UUID4_SIZE)

    # converting the binary to a opencv image
    nparr = numpy.frombuffer(image_data, numpy.uint8)
    image = cv2.imdecode(nparr, cv2.IMREAD_COLOR)

    return {'id': image_id, 'image': image}

def detect(image, model):
    boxes, labels, _conf = cvlib.detect_common_objects(image, model=model)
    return boxes, labels


def write_result(output, image_id, shape, boxes, labels):
    result = json.dumps({
        'shape': shape,
        'boxes': boxes, 
        'labels': labels
    }).encode("ascii")

    total_msg_size = len(result) + UUID4_SIZE

    header = pack("!I", total_msg_size)
    output.write(header)
    output.write(image_id)
    output.write(result)
    output.flush()

def run(model):
    input_f, output_f = setup_io()
    
    while True:
        msg = read_message(input_f)
        if msg is None: break
        
        #image shape
        height, width, _ = msg["image"].shape
        shape = {'width': width, 'height': height}

        #detect object
        boxes, labels = detect(msg["image"], model)

        #send result back to elixir
        write_result(output_f, msg["id"], shape, boxes, labels)

if __name__ == "__main__":
    model = "yolov3"
    if len(sys.argv) > 1: 
        model = sys.argv[1]
        
    run(model)