import cv2
import pytesseract
import matplotlib.pyplot as plt
import os


def get_canny_edges(
    img: cv2.Mat, blur_params=(5, 5), canny_params=(100, 200), canny_dilate=1
) -> tuple[cv2.Mat, cv2.Mat]:
    """
    Get the Canny edges of an image.
    """
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    gray = cv2.GaussianBlur(gray, blur_params, 0)
    edges = cv2.Canny(gray, canny_params[0], canny_params[1])
    edges = cv2.dilate(edges, None, iterations=canny_dilate)
    return gray, edges


def extract_text_from_image_by_area(
    edges: cv2.Mat,
    drawable_image: cv2.Mat,
    epsilon_error=0.02,
    pytesseract_config="--psm 7",
    objective_area=5000,
    aspect_ratio_margins=(2, 6),
) -> list:
    """
    Extract text from detected rectangular and triangular areas in the image.
    """
    contours, _ = cv2.findContours(edges, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    detected_texts = []

    for contour in contours:
        area = cv2.contourArea(contour)
        x_pos, y_pos, width, height = cv2.boundingRect(contour)
        epsilon = epsilon_error * cv2.arcLength(contour, True)
        approx = cv2.approxPolyDP(contour, epsilon, True)
        aspect_ratio = width / height

        if (
            len(approx) == 4
            and area > objective_area
            and aspect_ratio_margins[0] < aspect_ratio < aspect_ratio_margins[1]
        ):
            plate = drawable_image[y_pos : y_pos + height, x_pos : x_pos + width]
            plate_gray = cv2.cvtColor(plate, cv2.COLOR_BGR2GRAY)
            text = pytesseract.image_to_string(
                plate_gray, config=pytesseract_config
            ).strip()

            if text:
                detected_texts.append(text)
                cv2.rectangle(
                    drawable_image,
                    (x_pos, y_pos),
                    (x_pos + width, y_pos + height),
                    (0, 255, 0),
                    2,
                )
                cv2.putText(
                    drawable_image,
                    text,
                    (x_pos, y_pos - 10),
                    cv2.FONT_HERSHEY_SIMPLEX,
                    0.7,
                    (0, 255, 0),
                    2,
                )

        elif len(approx) == 3 and area > objective_area:  # Detect triangles
            plate = drawable_image[y_pos : y_pos + height, x_pos : x_pos + width]
            plate_gray = cv2.cvtColor(plate, cv2.COLOR_BGR2GRAY)
            text = pytesseract.image_to_string(
                plate_gray, config=pytesseract_config
            ).strip()

            if text:
                detected_texts.append(text)
                cv2.drawContours(drawable_image, [approx], -1, (255, 0, 0), 2)
                cv2.putText(
                    drawable_image,
                    text,
                    (x_pos, y_pos - 10),
                    cv2.FONT_HERSHEY_SIMPLEX,
                    0.7,
                    (255, 0, 0),
                    2,
                )

    return detected_texts, drawable_image


def get_slab_text(image_path: str) -> tuple:
    """
    Get text from an image with multiple attempts.
    """
    img = cv2.imread(image_path)
    attempts = [
        ((5, 5), (100, 200)),  # Default values
        ((7, 7), (50, 150)),  # Softer blur, lower canny threshold
        ((3, 3), (120, 250)),  # Sharper edges, higher threshold
    ]

    for blur_params, canny_params in attempts:
        _, edges = get_canny_edges(
            img, blur_params=blur_params, canny_params=canny_params
        )
        texts, updated_img = extract_text_from_image_by_area(edges, img)

        if texts:
            plt.imshow(edges, cmap="gray")
            plt.show()
            return texts, updated_img

    return None, img  # Return original image if no text found


def get_all_files_in_directory(directory: str) -> list:
    """
    Get all files in a directory recursively.
    """
    file_paths = []
    for root, _, files in os.walk(directory):
        for file in files:
            file_paths.append(os.path.join(root, file))
    return file_paths


directory_path = "./public/img/jpg/autos"
file_paths = get_all_files_in_directory(directory_path)

for file_path in file_paths:
    texts, img = get_slab_text(file_path)
    print(f"File: {file_path} - Texts: {texts}")

    if texts:
        plt.imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
        plt.show()
