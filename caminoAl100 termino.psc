Algoritmo JuegoCaminoAlCien_Visual
	Definir turno, i, dado, res Como Entero
	Definir ac1, ac2 Como Entero
	
	Definir hist1, hist2 Como Caracter
	Dimension hist1[6], hist2[6]
	
	ac1 <- 0
	ac2 <- 0
	
	Para i <- 1 Hasta 6 Hacer
		hist1[i] <- "--"
		hist2[i] <- "--"
	FinPara
	
	Para turno <- 1 Hasta 6 Hacer
		
		
		Limpiar Pantalla
		
		
		Escribir "===================================="
		Escribir " TURNO | JUGADOR 1 | JUGADOR 2"
		Escribir "===================================="
		Para i <- 1 Hasta 6 Hacer
			Escribir "   ", i, "[", hist1[i], "][", hist2[i], "]"
		FinPara
		Escribir "------------------------------------"
		Escribir " TOTAL [", ac1, "][", ac2,"]"
		Escribir "===================================="
		
		Si ac1 <= 100 Entonces
			Escribir ""
			Escribir ">>> [Turno ", turno, " - JUGADOR 1] <<<"
			dado <- Aleatorio(1,6)
			Escribir "El dado cayó en: ( ", dado, " )"
			Escribir "¿Qué deseas sumar?"
			Escribir "1. Sumar ", dado
			Escribir "2. Sumar ", dado * 10
			
			Repetir
				Escribir "Elige 1 o 2: "
				Leer res
			Hasta Que res = 1 O res = 2
			
			Si res = 1 Entonces
				ac1 <- ac1 + dado
				hist1[turno] <- ConvertirATexto(dado) 
				hist1[turno] <- ConvertirATexto(dado ) 
			SiNo
				ac1 <- ac1 + (dado * 10)
				hist1[turno] <- ConvertirATexto(dado * 10) 
			FinSi
			
			Si ac1 > 100 Entonces
				Escribir "¡Llegaste a ", ac1,"! Te pasaste de 100."
				Esperar 2 Segundos 
			FinSi
		Sino
			hist1[turno] <- "X" 
		FinSi
		
		Limpiar Pantalla
		
		
		Escribir "===================================="
		Escribir " TURNO | JUGADOR 1 | JUGADOR 2"
		Escribir "===================================="
		Para i <- 1 Hasta 6 Hacer
			Escribir "   ", i, "[", hist1[i], "][", hist2[i], "]"
		FinPara
		Escribir "------------------------------------"
		Escribir " TOTAL |    ", ac1, "       |    ", ac2
		Escribir "===================================="
		
		
		Si ac2 <= 100 Entonces
			Escribir ""
			Escribir ">>> [Turno ", turno, " - JUGADOR 2] <<<"
			dado <- Aleatorio(1,6)
			Escribir "El dado cayó en: ( ", dado, " )"
			Escribir "¿Qué deseas sumar?"
			Escribir "1. Sumar ", dado
			Escribir "2. Sumar ", dado * 10
			
			Repetir
				Escribir "Elige 1 o 2: "
				Leer res
			Hasta Que res = 1 O res = 2
			
			Si res = 1 Entonces
				ac2 <- ac2 + dado
				hist2[turno] <- ConvertirATexto(dado)
			Sino
				ac2 <- ac2 + (dado * 10)
				hist2[turno] <- ConvertirATexto(dado * 10)
			FinSi
			
			Si ac2 > 100 Entonces
				Escribir "¡Llegaste a ", ac2,"! Te pasaste de 100."
				Esperar 2 Segundos 
			FinSi
		Sino
			hist2[turno] <- "X" 
		FinSi
		
	FinPara
	
	
	Limpiar Pantalla
	Escribir "===================================="
	Escribir " TURNO | JUGADOR 1 | JUGADOR 2"
	Escribir "===================================="
	Para i <- 1 Hasta 6 Hacer
		Escribir "   ", i, "[", hist1[i], "][", hist2[i], "]"
	FinPara
	Escribir "------------------------------------"
	Escribir " TOTAL [", ac1, "][", ac2,"]"
	Escribir "===================================="
	
	Escribir ""
	Escribir "====== RESULTADOS FINALES ======"
	
	Si ac1 > 100 Y ac2 > 100 Entonces
		Escribir "Ambos jugadores se pasaron de 100. ¡Nadie gana!"
	Sino
		Si ac1 > 100 Entonces
			Escribir "El Jugador 1 se pasó. ¡El Jugador 2 GANA con ", ac2, " puntos!"
		Sino
			Si ac2 > 100 Entonces
				Escribir "El Jugador 2 se pasó. ¡El Jugador 1 GANA con ", ac1, " puntos!"
			Sino
				Si ac1 > ac2 Entonces
					Escribir "¡Felicidades! El Jugador 1 GANA por estar más cerca de 100."
				Sino
					Si ac2 > ac1 Entonces
						Escribir "¡Felicidades! El Jugador 2 GANA por estar más cerca de 100."
					Sino
						Escribir "¡Es un EMPATE! Ambos terminaron con ", ac1, " puntos."
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
FinAlgoritmo