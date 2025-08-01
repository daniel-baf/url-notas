from ..GestoInterface import GestoHandler


class CloseHandHandler(GestoHandler):
    def handle(self, fingers, landmarks):
        """
        Detects "Closed Hand" (✊): all fingers down and the hand is oriented upwards.

        Args:
            fingers (dict): Dictionary indicating which fingers are up.
            landmarks (list): List of hand landmark objects with .y attributes.

        Returns:
            str: "Closed Hand" if detected, otherwise passes to the next handler.
        """
        if (
            not any(fingers.values())  # All fingers down
            and all(
                landmark.y < landmarks[0].y for landmark in landmarks[1:]
            )  # Hand oriented upwards
        ):
            return "Mano cerrada"
        return super().handle(fingers, landmarks)


class FistHandler(GestoHandler):
    def handle(self, fingers, landmarks):
        """
        Detects "Fist" (🤛 / 🤜): all fingers down and the hand is NOT oriented upwards.

        Args:
            fingers (dict): Dictionary indicating which fingers are up.
            landmarks (list): List of hand landmark objects with .y attributes.

        Returns:
            str: "Fist" if detected, otherwise passes to the next handler.
        """
        all_fingers_down = not any(fingers.values())
        hand_upwards = all(landmark.y < landmarks[0].y for landmark in landmarks[1:])

        if all_fingers_down and not hand_upwards:
            return "Punio"
        return super().handle(fingers, landmarks)
