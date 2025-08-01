from handlers.GestoInterface import GestoHandler, distancia
from math import hypot


# 1) Saludo Vulcano 🖖
class VulcanoHandler(GestoHandler):
    def handle(self, fingers, landmarks):
        # Requerir que al menos los dedos índice, medio, anular y meñique estén levantados
        required_fingers = ["INDEX", "MIDDLE", "RING", "PINKY"]
        if not all(fingers[f] for f in required_fingers if f in fingers):
            return super().handle(fingers, landmarks)

        # Coordenadas de las puntas
        thumb_tip = landmarks[4]
        index_tip = landmarks[8]
        middle_tip = landmarks[12]
        ring_tip = landmarks[16]
        pinky_tip = landmarks[20]
        wrist = landmarks[0]

        # Tamaño de referencia de la mano (distancia muñeca a base de dedo medio)
        hand_size = distancia(wrist, landmarks[9])

        # Umbrales adaptativos
        fingers_close_threshold = hand_size * 0.2  # Aumentado de 0.15
        central_gap_threshold = hand_size * 0.3  # Aumentado de 0.25

        # Verificar que el pulgar esté separado (no parte de la "V")
        thumb_separated = (
            distancia(thumb_tip, index_tip) > fingers_close_threshold * 1.5
        )

        # Verificar grupos de dedos juntos
        index_middle_close = distancia(index_tip, middle_tip) < fingers_close_threshold
        ring_pinky_close = distancia(ring_tip, pinky_tip) < fingers_close_threshold

        # Verificar separación central
        middle_ring_separated = distancia(middle_tip, ring_tip) > central_gap_threshold

        # Opcional: verificar orientación (los dedos deberían apuntar hacia arriba/adelante)
        # Calculamos si los dedos están por encima de la muñeca (coordenada y menor)
        fingers_raised = (
            index_tip.y < wrist.y
            and middle_tip.y < wrist.y
            and ring_tip.y < wrist.y
            and pinky_tip.y < wrist.y
        )

        if (
            thumb_separated
            and index_middle_close
            and ring_pinky_close
            and middle_ring_separated
            and fingers_raised
        ):
            return "Saludo Vulcano 🖖"

        return super().handle(fingers, landmarks)


# 2) Alto ✋
class StopHandler(GestoHandler):
    def handle(self, fingers, landmarks):
        # 1. Verificar que todos los dedos estén levantados
        if not all(fingers.values()):
            return super().handle(fingers, landmarks)

        return (
            "Alto ✋"
            if fingers["index"] and fingers["middle"]
            else super().handle(fingers, landmarks)
        )


# 3) Mano Abierta 🖐️
class OpenHandHandler(GestoHandler):
    def handle(self, fingers, landmarks):
        # 1. Verificar que todos los dedos estén levantados
        if not all(fingers.values()):
            return super().handle(fingers, landmarks)

        # Puntos de referencia
        thumb_tip = landmarks[4]
        index_tip = landmarks[8]
        middle_tip = landmarks[12]
        ring_tip = landmarks[16]
        pinky_tip = landmarks[20]
        wrist = landmarks[0]

        # 2. Calcular tamaño de referencia de la mano
        hand_size = distancia(wrist, landmarks[9])

        # 3. Definir umbrales (ajustables)
        min_separation = hand_size * 0.25  # Mínima separación entre dedos
        max_thumb_separation = hand_size * 0.5  # El pulgar puede estar más separado

        # 4. Verificar separación entre dedos consecutivos
        # Pulgar-index
        thumb_index_sep = distancia(thumb_tip, index_tip) > max_thumb_separation
        # Índice-medio
        index_middle_sep = distancia(index_tip, middle_tip) > min_separation
        # Medio-anular
        middle_ring_sep = distancia(middle_tip, ring_tip) > min_separation
        # Anular-meñique
        ring_pinky_sep = distancia(ring_tip, pinky_tip) > min_separation

        # 5. Verificar que los dedos estén extendidos (no doblados)
        # Calculamos ángulos o distancias relativas para verificar extensión
        fingers_extended = (
            distancia(index_tip, wrist) > hand_size * 0.8
            and distancia(middle_tip, wrist) > hand_size * 0.9
            and distancia(ring_tip, wrist) > hand_size * 0.8
            and distancia(pinky_tip, wrist) > hand_size * 0.7
        )

        # 6. Verificar orientación (mano abierta hacia adelante/arriba)
        hand_orientation_ok = (
            index_tip.y < wrist.y
            and middle_tip.y < wrist.y
            and ring_tip.y < wrist.y
            and pinky_tip.y < wrist.y
        )

        # 7. Condición final
        if (
            thumb_index_sep
            and index_middle_sep
            and middle_ring_sep
            and ring_pinky_sep
            and fingers_extended
            and hand_orientation_ok
        ):
            return "Mano abierta"

        return super().handle(fingers, landmarks)
