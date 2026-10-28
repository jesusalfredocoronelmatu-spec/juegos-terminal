Algoritmo Clase_del_miercoles
	Definir VarlorDelDado, puntuacionJugador Como Entero;
	Definir opcionDeTiro Como Caracter;
	
	
	//i -> variable indice
	// hasta X -> punto de destino (n - 1 si i = 0)
	// con paso Y -> que tantos saltos se van a dar en cada interaccion
	//Escribir "2 x " (i +1) " = " (2 * (i + 1)) 
	Para i = 0 Hasta 5 Con Paso 1 Hacer
		Si puntuacionJugador <= 100  Entonces
			Escribir "______________"
			Escribir "Turno #" i + 1
			Escribir "Puntuacion:" puntuacionJugador
			Escribir "______________"
			
			ValorDelDado = Aleatorio(1,6);
			Escribir "El valor del dado es: " ValorDelDado
			
			Escribir "Elige una de las opciones: "
			Escribir "a) El valor del dado"
			Escribir "b) El valor del dado x10"
				Repetir
					
					Leer opcionDeTiro;
					opcionDeTiro=Minusculas(opcionDeTiro) 
					
					Segun opcionDeTiro Hacer
						"a" | "A":
							Escribir "El valor final sera: " ValorDelDado
							puntuacionJugador = puntuacionJugador + ValorDelDado
						"b" | "B":
							Escribir "El valor final sera: " ValorDelDado*10
							puntuacionJugador = puntuacionJugador + (ValorDelDado*10)
						De Otro Modo:
							Escribir "Opción equivocada: error "
							
							
					FinSegun
				Hasta Que opcionDeTiro="a" || opcionDeTiro="b"
			Si puntuacionJugador > 100  Entonces
				Escribir "Te pasaste!!!"
				
				
			FinSi
		FinSi
		
	FinPara
	si puntuacionJugador<=100 Entonces
		Escribir "ganastes"
	SiNo
		puntuacionJugador=-1
	FinSi
	
	Escribir "_____________"
	Escribir "Puntuacion final: " puntuacionJugador
FinAlgoritmo