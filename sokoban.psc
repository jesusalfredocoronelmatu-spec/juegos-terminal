// Función auxiliar para reemplazar un solo carácter en una cadena de texto
// Función auxiliar para reemplazar un solo carácter en una cadena de texto
SubProceso res = ModificarCadena(cadena_orig, pos, nuevo_c)
    Definir izq, der, res Como Caracter
    Si pos > 1 Entonces
        izq = Subcadena(cadena_orig, 1, pos - 1)
    Sino
        izq = ""
    FinSi
    Si pos < Longitud(cadena_orig) Entonces
        der = Subcadena(cadena_orig, pos + 1, Longitud(cadena_orig))
    Sino
        der = ""
    FinSi
    res = izq + nuevo_c + der
FinSubProceso


Algoritmo Sokoban10Niveles
    Definir mapa Como Caracter
    Dimension mapa[20]
    Definir filas, nivel, max_niveles, px, py Como Entero
    Definir juego_terminado, nivel_completado, reiniciar_nivel Como Logico
    Definir tecla, char_p, char_t, char_b, char_p_new, char_t_new, char_b_new Como Caracter
    Definir dx, dy, tx, ty, bx, by, i, j Como Entero
    Definir faltan_cajas Como Logico
    
    max_niveles = 10
    nivel = 1
    juego_terminado = Falso
    
    Mientras nivel <= max_niveles Y No juego_terminado Hacer
        // --- 1. CARGAR MAPA SEGÚN EL NIVEL ---
        filas = 0
        Segun nivel Hacer
            1: 
                mapa[1] = "#######"
                mapa[2] = "#   # #"
                mapa[3] = "# @$. #"
                mapa[4] = "#     #"
                mapa[5] = "#######"
                filas = 5
            2: 
                mapa[1] = "#########"
                mapa[2] = "#@  $  .#"
                mapa[3] = "#########"
                filas = 3
            3: 
                mapa[1] = "######"
                mapa[2] = "#   .#"
                mapa[3] = "# $$ #"
                mapa[4] = "# .@ #"
                mapa[5] = "######"
                filas = 5
            4: 
                mapa[1] = "########"
                mapa[2] = "#      #"
                mapa[3] = "# .$.  #"
                mapa[4] = "#  $   #"
                mapa[5] = "#  @   #"
                mapa[6] = "########"
                filas = 6
            5: 
                mapa[1] = "#######"
                mapa[2] = "#     #"
                mapa[3] = "# $ $ #"
                mapa[4] = "# .@. #"
                mapa[5] = "#######"
                filas = 5
            6: 
                mapa[1] = "#######"
                mapa[2] = "#.#   #"
                mapa[3] = "# $ $ #"
                mapa[4] = "#  #@ #"
                mapa[5] = "#   . #"
                mapa[6] = "#######"
                filas = 6
            7: 
                mapa[1] = "########"
                mapa[2] = "#   ...#"
                mapa[3] = "#  $$$ #"
                mapa[4] = "#   @  #"
                mapa[5] = "########"
                filas = 5
            8: 
                mapa[1] = "#######"
                mapa[2] = "#  .  #"
                mapa[3] = "#  $  #"
                mapa[4] = "#.$@$.#"
                mapa[5] = "#  $  #"
                mapa[6] = "#  .  #"
                mapa[7] = "#######"
                filas = 7
            9: 
                mapa[1] = "#######"
                mapa[2] = "# . . #"
                mapa[3] = "#  $  #"
                mapa[4] = "# $@$ #"
                mapa[5] = "# .   #"
                mapa[6] = "#######"
                filas = 6
            10: 
                mapa[1] = "#######"
                mapa[2] = "# ... #"
				mapa[3] = "# $$$ #"
				mapa[3] = "# #   #"
                mapa[4] = "# $$$ #"
                mapa[5] = "# ...@#"
                mapa[6] = "#######"
                filas = 6
        FinSegun
        
        // --- 2. ENCONTRAR AL JUGADOR ---
        Para i = 1 Hasta filas Hacer
            Para j = 1 Hasta Longitud(mapa[i]) Hacer
                char_p = Subcadena(mapa[i], j, j)
                Si char_p == "@" O char_p == "+" Entonces
                    py = i
                    px = j
                FinSi
            FinPara
        FinPara
        
        nivel_completado = Falso
        reiniciar_nivel = Falso
        
        // --- 3. BUCLE DEL NIVEL ---
        Mientras No nivel_completado Y No reiniciar_nivel Y No juego_terminado Hacer
            Borrar Pantalla
            Escribir "=== SOKOBAN - NIVEL ", nivel, " DE ", max_niveles, " ==="
            Escribir "Controles: [W A S D] Mover | [R] Reiniciar | [Q] Salir"
            Escribir "Símbolos: @ Jugador | $ Caja | . Meta | * Caja Lista | + Tú en Meta"
            Escribir "-----------------------------------------------------------------"
            
            // Dibujar mapa
            Para i = 1 Hasta filas Hacer
                Escribir mapa[i]
            FinPara
            
            // Comprobar victoria
            faltan_cajas = Falso
            Para i = 1 Hasta filas Hacer
                Para j = 1 Hasta Longitud(mapa[i]) Hacer
                    Si Subcadena(mapa[i], j, j) == "$" Entonces
                        faltan_cajas = Verdadero
                    FinSi
                FinPara
            FinPara
            
            Si No faltan_cajas Entonces
                Escribir "-----------------------------------------------------------------"
                Escribir "¡EXCELENTE! Has completado el Nivel ", nivel, "."
                Escribir "Presiona ENTER para continuar..."
                Esperar Tecla
                nivel_completado = Verdadero
            Sino
                // Leer movimiento
                Escribir ""
                Escribir "Tu movimiento + ENTER:"
                Leer tecla
                tecla = Minusculas(tecla)
                
                Si tecla == "q" Entonces
                    juego_terminado = Verdadero
                Sino
                    Si tecla == "r" Entonces
                        reiniciar_nivel = Verdadero
                    Sino
                        // Determinar dirección
                        dx = 0; dy = 0
                        Segun tecla Hacer
                            "w": dy = -1
                            "s": dy = 1
                            "a": dx = -1
                            "d": dx = 1
                        FinSegun
                        
                        Si dx <> 0 O dy <> 0 Entonces
                            tx = px + dx
                            ty = py + dy
                            bx = px + 2*dx
                            by = py + 2*dy
                            
                            char_p = Subcadena(mapa[py], px, px)
                            char_t = Subcadena(mapa[ty], tx, tx)
                            
                            Si char_p == "@" Entonces 
                                char_p_new = " "
                            FinSi
                            Si char_p == "+" Entonces 
                                char_p_new = "."
                            FinSi
                            
                            // LÓGICA 1: Mover a casilla vacía o meta
                            Si char_t == " " O char_t == "." Entonces
                                Si char_t == " " Entonces 
                                    char_t_new = "@"
                                FinSi
                                Si char_t == "." Entonces 
                                    char_t_new = "+"
                                FinSi
                                
                                mapa[py] = ModificarCadena(mapa[py], px, char_p_new)
                                mapa[ty] = ModificarCadena(mapa[ty], tx, char_t_new)
                                py = ty; px = tx
                                
                            Sino
                                // LÓGICA 2: Empujar caja
                                Si char_t == "$" O char_t == "*" Entonces
                                    char_b = Subcadena(mapa[by], bx, bx)
                                    
                                    Si char_b == " " O char_b == "." Entonces
                                        Si char_b == " " Entonces 
                                            char_b_new = "$"
                                        FinSi
                                        Si char_b == "." Entonces 
                                            char_b_new = "*"
                                        FinSi
                                        
                                        Si char_t == "$" Entonces 
                                            char_t_new = "@"
                                        FinSi
                                        Si char_t == "*" Entonces 
                                            char_t_new = "+"
                                        FinSi
                                        
                                        mapa[py] = ModificarCadena(mapa[py], px, char_p_new) 
                                        mapa[by] = ModificarCadena(mapa[by], bx, char_b_new) 
                                        mapa[ty] = ModificarCadena(mapa[ty], tx, char_t_new) 
                                        
                                        py = ty; px = tx
                                    FinSi
                                FinSi
                            FinSi
                        FinSi
                    FinSi
                FinSi
            FinSi
        FinMientras
        
        Si nivel_completado Entonces
            nivel = nivel + 1
        FinSi
        
    FinMientras
    
    Borrar Pantalla
    Si juego_terminado Entonces
        Escribir "Has salido del juego. ¡Hasta pronto!"
    Sino
        Escribir "¡FELICIDADES! Has superado los ", max_niveles, " niveles y terminado el juego."
    FinSi
FinAlgoritmo