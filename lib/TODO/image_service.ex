defmodule TODO.ImageService do
  alias Evision, as: Cv

  def load_model() do
    Path.join(__DIR__, "yolov8m.onnx") |> Ortex.load()
  end
  def load_image() do
    Path.join(__DIR__, "nx.jpeg")
    |> Cv.imread()
  end
  def run() do
    labels = [
      "person",
      "bicycle",
      "car",
      "motorcycle",
      "airplane",
      "bus",
      "train",
      "truck",
      "boat",
      "traffic light",
      "fire hydrant",
      "street sign",
      "stop sign",
      "parking meter",
      "bench",
      "bird",
      "dog",
      "cat",
      "horse",
      "sheep",
      "cow",
      "elephant",
      "bear",
      "zebra",
      "giraffe",
      "hat",
      "backpack",
      "umbrella",
      "shoe",
      "eye glasses",
      "handbag",
      "tie",
      "suitcase",
      "frisbee",
      "skis",
      "snowboard",
      "sports ball",
      "kite",
      "baseball bat",
      "baseball glove",
      "skateboard",
      "surfboard",
      "tennis racket",
      "bottle",
      "plate",
      "wine glass",
      "cup",
      "fork",
      "knife",
      "spoon",
      "bowl",
      "banana",
      "apple",
      "sandwich",
      "orange",
      "broccoli",
      "carrot",
      "hot dog",
      "pizza",
      "donut",
      "cake",
      "chair",
      "couch",
      "potted plant",
      "bed",
      "mirror",
      "dining table",
      "window",
      "desk",
      "toilet",
      "door",
      "tv",
      "laptop",
      "mouse",
      "remote",
      "keyboard",
      "cell phone",
      "microwave",
      "oven",
      "toaster",
      "sink",
      "refrigerator",
      "blender",
      "book",
      "clock",
      "vase",
      "scissors",
      "teddy bear",
      "hair drier",
      "toothbrush"
    ]

    ## load model
    model = load_model()

    serving = Nx.Serving.new(Ortex.Serving, model)

    image = load_image()

    image_evision =
      Cv.DNN.blobFromImage(
        image,
        scalefactor: 1 / 255.0,
        swapRB: true,
        size: {640, 480},
        crop: false
      )

    ## image to tensor
    image_tensor =
      image_evision
      |> Cv.Mat.to_nx(EXLA.Backend)

    ## predictions
    image_batch = Nx.Batch.stack([{image_tensor[0]}])

    # Nx.Defn.jit_apply(&Function.identity/1, [image_batch])

    predictions =
      with {result} <- Nx.Serving.run(serving, image_batch) do
        result[0]
        |> Nx.backend_transfer()
        |> Nx.transpose(axes: [1, 0])
      end

    ## Boxes
    prediction_bboxes =
      predictions|> Nx.slice([0, 0], [6300, 84])
      # |> IO.inspect(label: "label81")


    ## Scores
    prediction_scores = predictions |> Nx.slice([0, 4], [6300, 80])

    ## define classes
    classesID =
      prediction_scores
      |> Nx.vectorize(:rows)
      |> Nx.argmax(keep_axis: false)
      |> Nx.devectorize()
      |> Nx.to_flat_list()

    ## Get scores
    get_score = fn vec ->
      class = Nx.argmax(vec, keep_axis: false)
      Nx.take(vec, class)
    end

    scores =
      prediction_scores
      |> Nx.vectorize(:rows)
      |> get_score.()
      |> Nx.devectorize()
      |> Nx.to_list()
      # |> IO.inspect(label: "label12")

      bboxes =
        prediction_bboxes
        |> Nx.to_list()
        |> Enum.map(fn boxes ->
          List.to_tuple(boxes)
        end)


        {bboxes, scores}
        |> IO.inspect(label: "label1")


        nmsBoxes = Cv.DNN.nmsBoxes(bboxes, scores, 0.5, 0.2)


      #   make_image = fn ->
      #     {:ok, image} =
      #       image_tensor[0]
      #       |> Nx.transpose(axes: [1, 2, 0])
      #       |> Nx.multiply(255)
      #       |> Image.from_nx()
      #       |> IO.inspect(label: "label9")

      #     image
      #   end

      #   {:ok, evision_mat} =
      #     Enum.map(nmsBoxes, fn idx ->
      #       b =
      #         bboxes
      #         |> Enum.at(idx)
      #         |> Tuple.to_list()

      #       s =
      #         scores
      #         |> Enum.at(idx)

      #       c = Enum.at(classesID, idx)
      #       l = Enum.at(labels, c)

      #       {[b ++ [s]], l}
      #     end)
      #     |> draw_bbox_labels(make_image.())
      #     |> Image.to_evision()

      # ## Resize to original
      # {h, w, _} = image.shape
      # Cv.resize(evision_mat, {w, h})
  end

  def draw_bbox_labels(object_boxes, image) do
    Enum.reduce(object_boxes, image, fn {boxes, class_name}, image ->
      Enum.reduce(boxes, image, fn [cx, cy, w, h | _probs], image ->
        {text_image, _alpha} =
          Image.split_alpha(Image.Text.text!(class_name, font_size: 20))

        {:ok, image} =
          image
          |> Image.Draw.rect!(round(cx - w / 2), round(cy - h / 2), round(w), round(h),
            fill: false,
            color: :blue
          )
          |> Image.Draw.image(
            text_image,
            min(max(round(cx - w / 2), 0), 640),
            min(max(round(cy - h / 2), 0), 640)
          )

        image
      end)
    end)
  end
end
# v()
