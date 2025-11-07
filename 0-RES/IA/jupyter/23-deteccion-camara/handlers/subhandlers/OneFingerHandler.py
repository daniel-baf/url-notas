from handlers.GestoInterface import GestoHandler


class PointHandler(GestoHandler):
    def handle(self, fingers, landmarks):
        """
        Detects if the gesture is a pointing gesture (index finger extended, other fingers closed).
        Determines the pointing direction (left or right) based on the index finger orientation.

        Args:
            fingers (dict): Dictionary indicating which fingers are extended.
            landmarks (list): List of hand landmark objects with x, y coordinates.

        Returns:
            str or None: "Pointing left", "Pointing right", or passes to the next handler.
        """
        is_pointing = (
            fingers["index"]  # Index finger up
            and not fingers["thumb"]  # Thumb down (optional, depends on pointing style)
            and not fingers["middle"]
            and not fingers["ring"]
            and not fingers["pinky"]
        )

        if is_pointing:
            # Calculate orientation based on the direction of the index finger
            # Compare the x position of the index fingertip with its base
            index_tip = landmarks[8]
            index_base = landmarks[5]

            # Threshold to avoid false positives from small movements
            threshold = 0.1  # Adjustable as needed

            if index_tip.x < index_base.x - threshold:
                return "Apunta izquierda"
            elif index_tip.x > index_base.x + threshold:
                return "Apunta derecha"

        return super().handle(fingers, landmarks)


class LikeHandler(GestoHandler):
    """
    LikeHandler is a gesture handler that detects a "Like" gesture based on finger positions.

    Methods
    -------
    handle(dedos: dict, landmarks: list) -> str or None
        Determines if the detected finger configuration corresponds to a "Like" gesture.
        A "Like" is detected when only the thumb ("Pulgar") is up and all other fingers
        ("Indice", "Medio", "Anular", "Menique") are down. If the gesture does not match,
        the method delegates handling to the superclass.

    Parameters
    ----------
    dedos : dict
        A dictionary indicating the state (up/down) of each finger, with keys:
        "Pulgar", "Indice", "Medio", "Anular", "Menique".
    landmarks : list
        A list of hand landmark positions (not directly used in this handler).

    Returns
    -------
    str or None
        Returns "Like" if the gesture is detected, otherwise delegates to the superclass.
    """

    def handle(self, dedos, landmarks):
        # Umbrales configurables
        # 1. Verificación básica de dedos
        if dedos["thumb"] and not any(
            [dedos["index"], dedos["middle"], dedos["ring"], dedos["pinky"]]
        ):
            return "Pulgar arriba"

        return super().handle(dedos, landmarks)
