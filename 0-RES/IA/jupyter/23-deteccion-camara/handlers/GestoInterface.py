import math


class GestoHandler:
    def __init__(self):
        self.next_handler = None

    def set_next(self, handler):
        self.next_handler = handler
        return handler

    def handle(self, dedos, landmarks):
        if self.next_handler:
            return self.next_handler.handle(dedos, landmarks)
        return "Gestos no reconocidos"

    def calcular_angulo(self, v1, v2):
        """Calcula el ángulo entre dos vectores en grados"""
        producto_punto = v1[0] * v2[0] + v1[1] * v2[1]
        magnitud_v1 = math.sqrt(v1[0] ** 2 + v1[1] ** 2)
        magnitud_v2 = math.sqrt(v2[0] ** 2 + v2[1] ** 2)
        cos_theta = producto_punto / (magnitud_v1 * magnitud_v2)
        return math.degrees(math.acos(min(max(cos_theta, -1.0), 1.0)))


def dedos_levantados(landmarks, umbral_estirado=0.1, umbral_cerrado=0.05):
    """
    Detecta qué dedos están levantados basado en los landmarks de MediaPipe.

    Args:
        landmarks: Lista de landmarks de MediaPipe para la mano (21 puntos)
        mano: "derecha" o "izquierda" para determinar la orientación
        umbral_estirado: Umbral para considerar un dedo estirado (relativo al tamaño de la mano)
        umbral_cerrado: Umbral para considerar un dedo cerrado (relativo al tamaño de la mano)

    Returns:
        Diccionario con estado de cada dedo (True = estirado, False = cerrado)
    """
    # Calcular tamaño de referencia de la mano (distancia entre muñeca y base del dedo medio)
    tamano_mano = distancia(landmarks[0], landmarks[9])

    fingers = {
        "thumb": False,
        "index": False,
        "middle": False,
        "ring": False,
        "pinky": False,
    }

    # Umbrales absolutos basados en el tamaño de la mano
    umbral_estirado_abs = umbral_estirado * tamano_mano
    umbral_cerrado_abs = umbral_cerrado * tamano_mano

    # Detección para cada dedo (excepto pulgar)
    for finger, points in {
        "index": [8, 6, 7, 5],
        "middle": [12, 10, 11, 9],
        "ring": [16, 14, 15, 13],
        "pinky": [20, 18, 19, 17],
    }.items():
        # Distance between tip and base
        dist_tip_base = distancia(landmarks[points[0]], landmarks[points[3]])
        # Distance between tip and middle joint
        dist_tip_joint = distancia(landmarks[points[0]], landmarks[points[1]])

        # A finger is extended if the tip-base distance is greater than tip-joint distance
        fingers[finger] = (dist_tip_base - dist_tip_joint) > umbral_estirado_abs

    # Detección especial para el pulgar (usando ángulo)
    vector_pulgar = (landmarks[2].x - landmarks[1].x, landmarks[2].y - landmarks[1].y)
    vector_punta = (landmarks[4].x - landmarks[2].x, landmarks[4].y - landmarks[2].y)

    # Calcular ángulo entre los vectores
    angulo = GestoHandler().calcular_angulo(vector_pulgar, vector_punta)

    # El pulgar está levantado si el ángulo es pequeño (dedo recto)
    fingers["thumb"] = angulo < 30  # 30 degrees as threshold

    return fingers


def distancia(p1, p2):
    return math.sqrt((p2.x - p1.x) ** 2 + (p2.y - p1.y) ** 2 + (p2.z - p1.z) ** 2)
