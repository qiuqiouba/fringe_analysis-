% Rutina para contar franjas interferometricas
%
% se requiere que las franjas seleccionadas sea lo m�s vertical posibles, o
% antes utilizar un programa para girar la imagen. 
% antes de usar este programa se deben eliminar el ruido, tomar un solo
% canal y convertir a escala de grises o blanco y negro
% 
% para seleccionar la imagen, usa boton alterno del cursor y saldra un men�
% donde aparece el comando de ejecuci�n de crop
% 
% Programa escrito por: Vicente Torres Z��iga
% creacion: 20/dic/2009, �ltima modificaci�n: 17/feb/2010 

clear; close all; clc;  % comandos para limpiar la memoria

% Acondicionamiento de la imagen
I = imread('fringes3.jpg'); % cargando la imagen a analizar 
figure; imshow(I); title('Imagen original'); % imagen original a manipular
%I = imcrop(I); % selecciondo una parte de la imagen, la mejor

J = rgb2gray(I); % asegurando tener imagenes en escala de grises
format short % formato de salida de numeros, que es m�s comodo

 a = sum(J);% la imagen se convierte en una matriz
 a = a/max(a); % normalizando datos
 figure; plot(a); title('Curva de la imagen seleccionada');
  C = (max(a) -min(a))/(max(a) +min(a)); % contraste de las frajas,
 contador = 0; % inicializando el contador

 % Esto convierte unos o ceros la matriz z, para contar de modo m�s sencillo
 % la transici�n 
for n = 1:length(a) 
    if a(n) >= mean(a) % el promedio de a es el umbral.
       a(n) = 1;
    else a(n) = 0;
    end
end

% Emp�eza el contador de franjas
  for n = 1:(length(a)-1) % para escanear al vector
      if a(n) == a(n+1) % comparando entre primer vecino
      else contador = contador +1;
      % cuando dos numeros no son iguales, la transicion marca un 1 en el contador
      end
 end
         
 numero_de_franjas  =contador/2 % dividimos entre dos porque hace dos trasiones en cada franja, cuando entra y cuando sale

 % fin del programa
 
 