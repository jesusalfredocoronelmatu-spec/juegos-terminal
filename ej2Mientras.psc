Algoritmo ej2Mientras
	Definir numLeido, numSecreto Como Entero
	numSecreto=aleatorio(1,100)
	
	Mientras numSecreto<>numLeido Hacer
		
		Leer numLeido
		Limpiar Pantalla
		si numLeido> numSecreto Entonces
			Escribir "el numero es mayor"
		FinSi
		
		si numLeido<numSecreto Entonces
			Escribir "elnumero es menor"
		FinSi
	FinMientras
	
	Escribir "le atinastes es " numSecreto
	
FinAlgoritmo
