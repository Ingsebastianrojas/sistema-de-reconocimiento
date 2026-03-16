import cv2
import numpy as np 


class FaceService:

    def __init__(self):
        # Cargar modelo de detección de rostros
        self.face_cascade = cv2.CascadeClassifier(
            cv2.data.haarcascades + "haarcascade_frontalface_default.xml"
        )

    def capture_face(self):
        """
        Captura un rostro desde la cámara
        """
        camera = cv2.VideoCapture(0)

        while True:
            ret, frame = camera.read()
            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

            faces = self.face_cascade.detectMultiScale(
                gray,
                scaleFactor=1.3,
                minNeighbors=5
            )

            for (x, y, w, h) in faces:
                face = frame[y:y+h, x:x+w]

                cv2.rectangle(frame, (x, y), (x+w, y+h), (0,255,0), 2)

                cv2.imshow("Face Capture", frame)

                if cv2.waitKey(1) & 0xFF == ord("s"):
                    camera.release()
                    cv2.destroyAllWindows()
                    return face

            cv2.imshow("Face Capture", frame)

            if cv2.waitKey(1) & 0xFF == ord("q"):
                break

        camera.release()
        cv2.destroyAllWindows()

    def save_face(self, face_image, path):
        """
        Guarda la imagen del rostro
        """
        cv2.imwrite(path, face_image)

    def compare_faces(self, face1, face2):
        """
        Comparación simple entre rostros
        """
        face1 = cv2.resize(face1, (100,100))
        face2 = cv2.resize(face2, (100,100))

        diff = cv2.absdiff(face1, face2)

        score = np.mean(diff)

        return score