#Importante
#Para ejecutar este programa se debe tener instalado los siguientes paquetes:
import numpy as np
from scipy.interpolate import CubicHermiteSpline
import matplotlib.pyplot as plt
from skimage import io
import easygui
#Se instalan con los comandos:
# pip install scipy
# pip install matplotlib
# pip install scikit-image
# pip install easygui

ruta_imagen = easygui.fileopenbox(
    title="Seleccione una imagen", filetypes=["*.png", "*.jpg", "*.jpeg"]
)
imagen_original = io.imread(ruta_imagen, as_gray=True)


def interpolación_de_hermite(imagen, factor_re_escalado):
    original_height, original_width = imagen.shape
    puntosX = np.arange(original_width)
    puntosFx = imagen[0, :]
    puntosDfx = np.gradient(puntosFx)
    interpolación_hermite = CubicHermiteSpline(
        puntosX, puntosFx, puntosDfx, extrapolate="periodic"
    )
    nuevasX = np.arange(0, original_width - 1, factor_re_escalado)
    imagen_interpolada = interpolación_hermite(nuevasX)

    return imagen_interpolada


escalado = 0.5
imagen_re_escalada = interpolación_de_hermite(imagen_original, escalado)
plt.figure(figsize=(20, 8))
plt.clf()
plt.subplot(1, 3, 1)
plt.imshow(imagen_original, cmap="gray")
plt.title("Imagen Original")
plt.subplot(1, 3, 2)
plt.imshow(imagen_re_escalada.reshape((1, -1)), cmap="gray")
plt.title("Imagen Reescalada")
plt.subplot(1, 3, 3)
plt.plot(imagen_original[0, :], label="Original")
plt.plot(imagen_re_escalada, label="Escalada")
plt.title("Perfil de Intensidad")
plt.legend()
plt.show()
