from GestoHandler import GestoHandler, distancia


class VictoriaHandler(GestoHandler):
    def handle(self, dedos, landmarks):
        # Detecta el gesto de "Victoria" (✌️): índice y medio levantados, los demás abajo
        if (
            dedos["Indice"]
            and dedos["Medio"]
            and not dedos["Pulgar"]
            and not dedos["Anular"]
            and not dedos["Menique"]
            # Los dedos índice y medio deben estar claramente extendidos
            and landmarks[8].y < landmarks[6].y
            and landmarks[12].y < landmarks[10].y
            # Los dedos índice y medio deben estar separados (no juntos)
            and abs(landmarks[8].x - landmarks[12].x) > 0.05
        ):
            return "Victoria ✌️"
        return super().handle(dedos, landmarks)


class PulgarArribaHandler(GestoHandler):
    def handle(self, dedos, landmarks):
        # Detecta "Pulgar Arriba" (👍): solo el pulgar levantado, los demás abajo
        if (
            dedos["Pulgar"]
            and not any(
                [dedos["Indice"], dedos["Medio"], dedos["Anular"], dedos["Menique"]]
            )
            and landmarks[4].y < landmarks[3].y  # Pulgar claramente arriba
            and abs(landmarks[4].x - landmarks[3].x) < 0.08  # Pulgar casi vertical
        ):
            return "Pulgar Arriba 👍"
        return super().handle(dedos, landmarks)


class ManoAbiertaHandler(GestoHandler):
    def handle(self, dedos, landmarks):
        # Verificamos que todos los dedos estén levantados
        if not all(dedos.values()):
            return super().handle(dedos, landmarks)

        # Puntos clave de referencia
        muñeca = landmarks[0]
        dedos_puntas = [landmarks[8], landmarks[12], landmarks[16], landmarks[20]]
        dedos_base = [landmarks[5], landmarks[9], landmarks[13], landmarks[17]]

        # 1. Verificar que todos los dedos estén extendidos (punta visiblemente más arriba que base)
        dedos_extendidos = all(
            punta.y < base.y * 0.85 for punta, base in zip(dedos_puntas, dedos_base)
        )

        # 2. Verificar que los dedos estén relativamente separados
        distancias = [
            distancia(landmarks[8], landmarks[12]),
            distancia(landmarks[12], landmarks[16]),
            distancia(landmarks[16], landmarks[20]),
        ]
        dedos_separados = all(d > 0.08 for d in distancias)

        # 3. Verificar posición relativa a la muñeca (mano abierta hacia arriba)
        mano_orientada_arriba = all(punta.y < muñeca.y for punta in dedos_puntas)

        # 4. Verificar que el pulgar esté extendido y separado
        pulgar_extendido = (
            landmarks[4].y < landmarks[2].y  # Punta sobre articulación
            and distancia(landmarks[4], landmarks[8]) > 0.1  # Separado del índice
        )

        if (
            dedos_extendidos
            and dedos_separados
            and mano_orientada_arriba
            and pulgar_extendido
        ):
            return "Mano Abierta 🖐️"

        return super().handle(dedos, landmarks)


class AltoHandler(GestoHandler):
    def handle(self, dedos, landmarks):
        # Detecta "Alto" (✋): mano abierta, dedos extendidos y orientada hacia arriba
        if (
            dedos["Pulgar"]
            and dedos["Indice"]
            and dedos["Medio"]
            and dedos["Anular"]
            and dedos["Menique"]
            # Mano orientada hacia arriba
            and all(landmark.y < landmarks[0].y for landmark in landmarks[1:])
        ):
            return "Alto ✋"
        return super().handle(dedos, landmarks)


class ManoCerradaHandler(GestoHandler):
    def handle(self, dedos, landmarks):
        # Detecta "Mano Cerrada" (✊): todos los dedos abajo y la mano orientada hacia arriba
        if (
            not any(dedos.values())  # Todos los dedos abajo
            and all(
                landmark.y < landmarks[0].y for landmark in landmarks[1:]
            )  # Mano orientada hacia arriba
        ):
            return "Mano Cerrada ✊"
        return super().handle(dedos, landmarks)


class CuernosHandler(GestoHandler):
    def handle(self, dedos, landmarks):
        # Detecta "Cuernos" (🤘): índice y meñique levantados, los demás abajo
        if (
            dedos["Indice"]
            and dedos["Menique"]
            and not any(
                [dedos["Pulgar"], dedos["Medio"], dedos["Anular"]]
            )  # Otros dedos no levantados
            and landmarks[8].y < landmarks[6].y  # Índice extendido
            and landmarks[20].y < landmarks[18].y  # Meñique extendido
            and abs(landmarks[8].x - landmarks[20].x) > 0.05  # Dedos separados
            and abs(landmarks[8].y - landmarks[20].y)
            < 0.05  # Dedos alineados verticalmente
        ):
            return "Cuernos 🤘"


class TeQuieroHandler(GestoHandler):
    def handle(self, dedos, landmarks):
        # Detecta "Te Quiero" (🤟): índice, meñique y pulgar levantados, medio y anular abajo
        if (
            dedos["Indice"]
            and dedos["Menique"]
            and dedos["Pulgar"]
            and not dedos["Medio"]
            and not dedos["Anular"]
            and landmarks[8].y < landmarks[6].y  # Índice extendido
            and landmarks[20].y < landmarks[18].y  # Meñique extendido
            and landmarks[4].y < landmarks[2].y  # Pulgar extendido
            and abs(landmarks[8].x - landmarks[20].x)
            > 0.05  # Índice y meñique separados
            and abs(landmarks[8].y - landmarks[20].y)
            < 0.05  # Índice y meñique alineados verticalmente
        ):
            return "Te Quiero 🤟"
        return super().handle(dedos, landmarks)


class LlamameHandler(GestoHandler):
    def handle(self, dedos, landmarks):
        # 1. Verificar dedos: solo pulgar y meñique levantados
        if (
            dedos["Pulgar"]
            and dedos["Menique"]
            and not (dedos["Indice"] or dedos["Medio"] or dedos["Anular"])
        ):
            # 2. Verificar que pulgar y meñique estén extendidos localmente (punta más lejos que base en línea con el eje)
            pulgar_extendido = distancia(landmarks[4], landmarks[2]) > 0.03
            menique_extendido = distancia(landmarks[20], landmarks[18]) > 0.03

            # 3. Verificar que estén suficientemente separados
            separados = distancia(landmarks[4], landmarks[20]) > 0.08

            if pulgar_extendido and menique_extendido and separados:
                return "Llámame 🤙"

        return super().handle(dedos, landmarks)
