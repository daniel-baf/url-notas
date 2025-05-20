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


def distancia(p1, p2):
    return math.sqrt((p2.x - p1.x) ** 2 + (p2.y - p1.y) ** 2 + (p2.z - p1.z) ** 2)
