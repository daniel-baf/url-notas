import cv2
import mediapipe as mp
import math
import numpy as np
from GestoHandler import (
    distancia,
)
from HandsHandler import (
    CuernosHandler,
    LlamameHandler,
    ManoCerradaHandler,
    TeQuieroHandler,
    VictoriaHandler,
    PulgarArribaHandler,
    ManoAbiertaHandler,
    AltoHandler,
)

# MediaPipe
mp_drawing = mp.solutions.drawing_utils
mp_hands = mp.solutions.hands


def dedos_levantados(landmarks):
    # Coordenadas de referencia
    muñeca = landmarks[0]
    base_pulgar = landmarks[2]
    punta_pulgar = landmarks[4]

    # Detección mejorada del pulgar
    # 1. Comparamos posición vertical (y) de la punta con la articulación
    # 2. Verificamos la distancia desde la muñeca
    # 3. Usamos un umbral adaptativo basado en la posición de la mano

    # Calculamos la orientación general de la mano (izquierda/derecha)
    es_mano_izquierda = landmarks[5].x > landmarks[17].x

    # Umbral adaptativo basado en el tamaño de la mano
    tamaño_mano = distancia(landmarks[0], landmarks[9])
    umbral_pulgar = tamaño_mano * 0.15

    # Detección del pulgar
    pulgar_levantado = False
    if es_mano_izquierda:
        # Para mano izquierda, pulgar a la derecha (x aumenta)
        pulgar_levantado = (
            punta_pulgar.x > base_pulgar.x * 1.05
            and punta_pulgar.y < base_pulgar.y
            and distancia(punta_pulgar, muñeca)
            > distancia(base_pulgar, muñeca) + umbral_pulgar
        )
    else:
        # Para mano derecha, pulgar a la izquierda (x disminuye)
        pulgar_levantado = (
            punta_pulgar.x < base_pulgar.x * 0.95
            and punta_pulgar.y < base_pulgar.y
            and distancia(punta_pulgar, muñeca)
            > distancia(base_pulgar, muñeca) + umbral_pulgar
        )

    return {
        "Pulgar": pulgar_levantado,
        "Indice": landmarks[8].y < landmarks[6].y * 0.95,  # 5% de tolerancia
        "Medio": landmarks[12].y < landmarks[10].y * 0.95,
        "Anular": landmarks[16].y < landmarks[14].y * 0.95,
        "Menique": landmarks[20].y < landmarks[18].y * 0.95,
    }


# class OKHandler(GestoHandler):
#     def handle(self, dedos, landmarks):
#         # Verificamos las condiciones básicas del gesto OK
#         condiciones_ok = (
#             dedos["Pulgar"]
#             and dedos["Indice"]  # Índice debe estar levantado
#             and not any(
#                 [dedos["Medio"], dedos["Anular"], dedos["Menique"]]
#             )  # Otros dedos no levantados
#             and distancia(landmarks[4], landmarks[8]) < 0.05  # Pulgar cerca del índice
#             and landmarks[8].y < landmarks[6].y  # Índice extendido
#             and landmarks[4].y < landmarks[3].y  # Pulgar claramente levantado
#         )

#         # Condición adicional: verificar curvatura de los dedos no activos
#         dedos_no_activos_curvados = (
#             landmarks[12].y > landmarks[10].y * 1.05  # Medio curvado
#             and landmarks[16].y > landmarks[14].y * 1.05  # Anular curvado
#             and landmarks[20].y > landmarks[18].y * 1.05  # Menique curvado
#         )

#         if condiciones_ok and dedos_no_activos_curvados:
#             return "OK 👌"
#         return super().handle(dedos, landmarks)


# class RockHandler(GestoHandler):
#     def handle(self, dedos, landmarks):
#         if (
#             dedos["Indice"]
#             and dedos["Menique"]
#             and not any([dedos["Pulgar"], dedos["Medio"], dedos["Anular"]])
#             and landmarks[8].y < landmarks[6].y  # Índice extendido
#             and landmarks[20].y < landmarks[18].y  # Menique extendido
#         ):
#             return "Cuernos 🤘"
#         return super().handle(dedos, landmarks)


# class LlamameHandler(GestoHandler):
#     def handle(self, dedos, landmarks):
#         if (
#             dedos["Pulgar"]
#             and dedos["Menique"]
#             and not any([dedos["Indice"], dedos["Medio"], dedos["Anular"]])
#             and landmarks[4].y < landmarks[2].y  # Pulgar arriba
#             and landmarks[20].y < landmarks[18].y  # Menique extendido
#         ):
#             return "Llámame 🤙"
#         return super().handle(dedos, landmarks)


# class VulcanoHandler(GestoHandler):
#     def handle(self, dedos, landmarks):
#         if (
#             dedos["Indice"]
#             and dedos["Medio"]
#             and dedos["Anular"]
#             and dedos["Menique"]
#             and not dedos["Pulgar"]
#             and abs(landmarks[8].y - landmarks[12].y)
#             < 0.03  # Dedos alineados verticalmente
#             and abs(landmarks[12].y - landmarks[16].y) < 0.03
#             and abs(landmarks[16].y - landmarks[20].y) < 0.03
#         ):
#             return "Saludo Vulcano 🖖"
#         return super().handle(dedos, landmarks)


# class PinzaHandler(GestoHandler):
#     def handle(self, dedos, landmarks):
#         if (
#             dedos["Pulgar"]
#             and dedos["Indice"]
#             and not any([dedos["Medio"], dedos["Anular"], dedos["Menique"]])
#             and distancia(landmarks[4], landmarks[8]) < 0.03
#             and landmarks[4].z < landmarks[8].z  # Pulgar frente al índice
#         ):
#             return "Pinza 🤏"
#         return super().handle(dedos, landmarks)


# class SenalarHandler(GestoHandler):
#     def handle(self, dedos, landmarks):
#         if dedos["Indice"] and not any(
#             [dedos["Pulgar"], dedos["Medio"], dedos["Anular"], dedos["Menique"]]
#         ):
#             # Calculamos la dirección del dedo índice
#             dx = landmarks[8].x - landmarks[5].x
#             dy = landmarks[8].y - landmarks[5].y
#             angle = math.degrees(math.atan2(dy, dx))

#             if -45 < angle < 45:  # Derecha
#                 return "Señalar Derecha 👉"
#             elif 135 < angle < 180 or -180 < angle < -135:  # Izquierda
#                 return "Señalar Izquierda 👈"
#             elif -135 < angle < -45:  # Arriba
#                 return "Señalar Arriba 👆"
#             elif 45 < angle < 135:  # Abajo
#                 return "Señalar Abajo 👇"

#         return super().handle(dedos, landmarks)


# # Configurar cadena de responsabilidad
handler_chain = VictoriaHandler()
handler_chain.set_next(ManoCerradaHandler()).set_next(PulgarArribaHandler()).set_next(
    ManoAbiertaHandler()
).set_next(AltoHandler()).set_next(LlamameHandler()).set_next(
w    TeQuieroHandler()
).set_next(CuernosHandler())
# handler_chain.set_next(PulgarArribaHandler()).set_next(OKHandler()).set_next(
#     AltoHandler()
# ).set_next(ManoAbiertaHandler()).set_next(ManoCerradaHandler()).set_next(
#     RockHandler()
# ).set_next(LlamameHandler()).set_next(VulcanoHandler()).set_next(
#     PinzaHandler()
# ).set_next(SenalarHandler())

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
