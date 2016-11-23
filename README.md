# ForPrintingGeniusArrays
Letrero que muestra un mensaje por los displays de 7 segmentos de la FPGA Xilinx Spartan 3

#Estructura Inicial
El programa principal contiene una entidad "Mensaje" y se encarga de manejar las entradas y salidas de la FPGA.
Mensaje contiene cuatro endidades "Letra" y almacena el mensaje, manejando la velocidad con la que aparece.
Letra decodifica la letra recibida y la muestra por el display que le corresponda.
