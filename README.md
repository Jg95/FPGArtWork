# FPGArtWork
Letrero que muestra un mensaje por los displays de 7 segmentos de la FPGA Xilinx Spartan 3

#Estructura Inicial
El programa principal contiene una entidad "Mensaje" y se encarga de manejar las entradas y salidas de la FPGA.
Mensaje contiene cuatro endidades "Letra" y almacena el mensaje, manejando la velocidad con la que aparece.
Letra decodifica la letra recibida y la muestra por el display que le corresponda.

## Programa básico:
El prograa utiliza las salidas de 7 segmentos para mostrar un mensaje (E13, F14, G14 y D14).
La velocidad del mensaje se regula con los botones M14 y M13. Será necesaria una entidad para controlar la velocidad del mensaje, otra que contenga el/los mensajes, para sincronizar los botones y eliminar los rebotes.
### Entidades:
Top: Entidad vacía de interfaz con la FPGA. Reloj, Reset, botón acelerar y decelerar, controlar segmentos y ánodos

## Posibles mejoras: 
1. Varios mensajes seleccionables con los interrupotores (F12, G12 y H14).
2. Dejar pulsado el botón para oto cambio de velocidad
