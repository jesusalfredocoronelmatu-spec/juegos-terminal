Algoritmo Snake_Juego_Corregido
	Definir alto, ancho, i, j, k Como Entero;
	Definir cabezaX, cabezaY, manzanaX, manzanaY Como Entero;
	Definir colaX, colaY, tamano, maxTamano Como Entero;
	Definir gameOver Como Logico;
	Definir direccion, tecla Como Caracter;
	Definir dibujado Como Logico;
	
	alto <- 15
	
	ancho <- 20;
	maxTamano <- 100;
	Dimension colaX[100];
	Dimension colaY[100];
	
	
	cabezaX <- 10;
	cabezaY <- 7;
	tamano <- 1;
	colaX[1] <- cabezaX;
	colaY[1] <- cabezaY;
	direccion <- "d";
	gameOver <- Falso;
	
	
	manzanaX <- Aleatorio(2, ancho - 1);
	manzanaY <- Aleatorio(2, alto - 1);
	
	Mientras No gameOver Hacer
		Limpiar Pantalla;
		
		
		Para i <- 1 Hasta alto Hacer
			Para j <- 1 Hasta ancho Hacer
				dibujado <- Falso;
				
				
				Si i = 1 O i = alto O j = 1 O j = ancho Entonces
					Escribir Sin Saltar "#";
					dibujado <- Verdadero;
				SiNo
					
					Si i = cabezaY Y j = cabezaX Entonces
						Escribir Sin Saltar "O";
						dibujado <- Verdadero;
					SiNo
						
						Si i = manzanaY Y j = manzanaX Entonces
							Escribir Sin Saltar "@";
							dibujado <- Verdadero;
						SiNo
							
							Para k <- 2 Hasta tamano Hacer
								Si colaX[k] = j Y colaY[k] = i Entonces
									Escribir Sin Saltar "o";
									dibujado <- Verdadero;
								FinSi
							FinPara
							
							
							Si No dibujado Entonces
								Escribir Sin Saltar " ";
							FinSi
						FinSi
					FinSi
				FinSi
			FinPara
			Escribir "";
		FinPara
		
		Escribir "Puntuacion: ", tamano - 1;
		Escribir "Ingresa una letra (W, A, S, D) y presiona ENTER.";
		Escribir "Para seguir derecho, teclea X y da ENTER."; 
		Leer tecla;
		tecla <- Minusculas(tecla);
		
		
		Si tecla = "w" O tecla = "s" O tecla = "a" O tecla = "d" Entonces
			Si No (tecla = "w" Y direccion = "s") Y No (tecla = "s" Y direccion = "w") Y No (tecla = "a" Y direccion = "d") Y No (tecla = "d" Y direccion = "a") Entonces
				direccion <- tecla;
			FinSi
		FinSi
		
		
		Si tamano > 1 Entonces
			Para k <- tamano Hasta 2 Con Paso -1 Hacer
				colaX[k] <- colaX[k-1];
				colaY[k] <- colaY[k-1];
			FinPara
		FinSi
		
		
		Segun direccion Hacer
			"w": cabezaY <- cabezaY - 1;
			"s": cabezaY <- cabezaY + 1;
			"a": cabezaX <- cabezaX - 1;
			"d": cabezaX <- cabezaX + 1;
		FinSegun
		
		colaX[1] <- cabezaX;
		colaY[1] <- cabezaY;
		
		
		Si cabezaX = 1 O cabezaX = ancho O cabezaY = 1 O cabezaY = alto Entonces
			gameOver <- Verdadero;
		FinSi
		
		
		Si tamano > 1 Entonces
			Para k <- 2 Hasta tamano Hacer
				Si cabezaX = colaX[k] Y cabezaY = colaY[k] Entonces
					gameOver <- Verdadero;
				FinSi
			FinPara
		FinSi
		
		
		Si cabezaX = manzanaX Y cabezaY = manzanaY Entonces
			Si tamano < maxTamano Entonces
				tamano <- tamano + 1;
				
				colaX[tamano] <- colaX[tamano-1];
				colaY[tamano] <- colaY[tamano-1];
			FinSi
			manzanaX <- Aleatorio(2, ancho - 1);
			manzanaY <- Aleatorio(2, alto - 1);
		FinSi
		
	FinMientras
	
	Limpiar Pantalla;
	Escribir "=======================";
	Escribir "      FIN DEL JUEGO    ";
	Escribir "   Puntuacion: ", tamano - 1;
	Escribir "=======================";
FinAlgoritmo