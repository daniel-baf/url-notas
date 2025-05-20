import cv2
import mediapipe as mp
from handlers.GestoInterface import dedos_levantados
from handlers.ChainBuilder import get_chain_handlers


# MediaPipe
mp_drawing = mp.solutions.drawing_utils
mp_hands = mp.solutions.hands

# # Configurar cadena de responsabilidad
handler_chain = get_chain_handlers()

# Captura de cámara
cap = cv2.VideoCapture(0)

with mp_hands.Hands(
    static_image_mode=False,
    max_num_hands=2,
    min_detection_confidence=0.7,
    min_tracking_confidence=0.7,
) as hands:
    while cap.isOpened():
        success, image = cap.read()
        if not success:
            print("No se pudo capturar la imagen")
            continue

        image = cv2.flip(image, 1)
        image_rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        results = hands.process(image_rgb)

        if results.multi_hand_landmarks:
            for hand_landmarks in results.multi_hand_landmarks:
                mp_drawing.draw_landmarks(
                    image, hand_landmarks, mp_hands.HAND_CONNECTIONS
                )
                landmarks = hand_landmarks.landmark
                dedos = dedos_levantados(landmarks)
                gesto = handler_chain.handle(dedos, landmarks)

                # Mostrar información de dedos detectados
                dedos_texto = ", ".join([k for k, v in dedos.items() if v])
                cv2.putText(
                    image,
                    f"Dedos: {dedos_texto if dedos_texto else 'Ninguno'}",
                    (10, 30),
                    cv2.FONT_HERSHEY_SIMPLEX,
                    0.7,
                    (150, 255, 0),
                    2,
                )
                cv2.putText(
                    image,
                    f"Gesto: {gesto}",
                    (10, 60),
                    cv2.FONT_HERSHEY_SIMPLEX,
                    0.8,
                    (255, 0, 0),
                    2,
                )

        cv2.imshow("Deteccion de Gestos Mejorada", image)

        key = cv2.waitKey(5) & 0xFF
        if (
            key == ord("q")
            or cv2.getWindowProperty(
                "Deteccion de Gestos Mejorada", cv2.WND_PROP_VISIBLE
            )
            < 1
        ):
            break

cap.release()
cv2.destroyAllWindows()
