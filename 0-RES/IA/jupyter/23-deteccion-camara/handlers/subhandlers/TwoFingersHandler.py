from handlers.GestoInterface import GestoHandler, distancia


class VictoryHandler(GestoHandler):
    """
    Handler to detect the 'Victoria' (✌️) gesture: two fingers up.
    Assumes input is a list of booleans indicating which fingers are up.
    Convention: [thumb, index, middle, ring, pinky]
    """

    def handle(self, fingers, landmarks):
        # Verifica si solo el índice y el medio están levantados
        if (
            fingers["index"]
            and fingers["middle"]
            and not fingers["ring"]
            and not fingers["pinky"]
        ):
            return "Victoria"

        return super().handle(fingers, landmarks)


class RockHandler(GestoHandler):
    """
    Handler to detect the 'Rock' (🤘) gesture: index and pinky fingers up.
    Assumes input is a list of booleans indicating which fingers are up.
    Convention: [thumb, index, middle, ring, pinky]
    """

    def handle(self, dedos, landmarks):
        # Verifica si solo el índice y el meñique están levantados
        if (
            dedos["index"]
            and dedos["pinky"]
            and not any(dedos[finger] for finger in ["thumb", "middle", "ring"])
        ):
            return "Cuernos"

        return super().handle(dedos, landmarks)


class LoveHandler(GestoHandler):
    """
    Handler to detect the 'Love' (🤟) gesture: thumb, index, and pinky fingers up.
    Assumes input is a dict of booleans indicating which fingers are up.
    Convention: [thumb, index, middle, ring, pinky]
    """

    def handle(self, dedos, landmarks):
        # Verifica si el pulgar, índice y meñique están levantados, y los otros no
        if (
            dedos["thumb"]
            and dedos["index"]
            and not dedos["middle"]
            and not dedos["ring"]
            and dedos["pinky"]
        ):
            return "Te quiero"

        return super().handle(dedos, landmarks)


class CallMeHandler(GestoHandler):
    """
    Handler to detect the 'Call Me' (🤙) gesture: thumb and pinky fingers up.
    Assumes input is a dict of booleans indicating which fingers are up.
    Convention: [thumb, index, middle, ring, pinky]
    """

    def handle(self, dedos, landmarks):
        # Verifica si solo el pulgar y el meñique están levantados
        if (
            dedos["thumb"]
            and not dedos["index"]
            and not dedos["middle"]
            and not dedos["ring"]
            and dedos["pinky"]
        ):
            return "Llamame"

        return super().handle(dedos, landmarks)


class PinchHandler(GestoHandler):
    """
    Handler to detect the 'Pinch' (🤏) gesture: thumb and index finger tips close together.
    Assumes input is a dict of booleans indicating which fingers are up.
    Convention: [thumb, index, middle, ring, pinky]
    Uses the distance between the thumb and index finger tips from landmarks.
    """

    def handle(self, fingers, landmarks):
        # Check if all fingers (except thumb) are close to the thumb tip
        thumb_tip = landmarks[4]
        close_threshold = 0.07  # Adjust as needed for sensitivity

        all_close = True
        finger_tips_indices = {"index": 8, "middle": 12, "ring": 16, "pinky": 20}
        for finger, idx in finger_tips_indices.items():
            if distancia(thumb_tip, landmarks[idx]) >= close_threshold:
                all_close = False
                break

        if all_close:
            return "Pinza"

        return super().handle(fingers, landmarks)


class OkHandler(GestoHandler):
    """
    Handler to detect the 'OK' (👌) gesture: thumb and index finger tips touching, other fingers extended or relaxed.
    Uses the distance between the thumb and index finger tips from landmarks.
    """

    def handle(self, fingers, landmarks):
        thumb_tip = landmarks[4]
        index_tip = landmarks[8]
        ok_threshold = 0.07  # Adjust as needed for sensitivity

        # Check if thumb and index tips are close together
        if distancia(thumb_tip, index_tip) < ok_threshold:
            return "OK"

        return super().handle(fingers, landmarks)


class CoreanHeartHandler(GestoHandler):
    def handle(self, fingers, landmarks):
        if (
            fingers["thumb"]
            and fingers["index"]
            and not fingers["middle"]
            and not fingers["ring"]
            and not fingers["pinky"]
        ):
            punta_indice = landmarks[8]
            punta_pulgar = landmarks[4]

            # Verifica si están cruzados (cercanos en X e Y)
            cruzan_en_x = abs(punta_indice.x - punta_pulgar.x) < 0.02
            cruzan_en_y = abs(punta_indice.y - punta_pulgar.y) < 0.02

            # Verifica que estén cerca
            distancia_dedos = distancia(punta_indice, punta_pulgar)
            tamano_mano = distancia(landmarks[0], landmarks[9])
            umbral = tamano_mano * 0.2

            if distancia_dedos < umbral and cruzan_en_x and cruzan_en_y:
                return "Corazón Coreano 🫰"

        return super().handle(fingers, landmarks)
