import java.util.Scanner;
import java.util.Random;

public class SnakeJuegoCorregido {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        int alto = 15;
        int ancho = 20;
        int maxTamano = 100;

        int[] colaX = new int[maxTamano + 1];
        int[] colaY = new int[maxTamano + 1];

        int cabezaX = 10;
        int cabezaY = 7;
        int tamano = 1;

        colaX[1] = cabezaX;
        colaY[1] = cabezaY;

        String direccion = "d";
        boolean gameOver = false;

        int manzanaX = random.nextInt(ancho - 2) + 2;
        int manzanaY = random.nextInt(alto - 2) + 2;

        while (!gameOver) {
           
            for (int i = 1; i <= alto; i++) {
                for (int j = 1; j <= ancho; j++) {
                    boolean dibujado = false;

                  
                    if (i == 1 || i == alto || j == 1 || j == ancho) {
                        System.out.print("#");
                        dibujado = true;
                    } else {
                        
                        if (i == cabezaY && j == cabezaX) {
                            System.out.print("O");
                            dibujado = true;
                        } else {
                            
                            if (i == manzanaY && j == manzanaX) {
                                System.out.print("@");
                                dibujado = true;
                            } else {
                                
                                for (int k = 2; k <= tamano; k++) {
                                    if (colaX[k] == j && colaY[k] == i) {
                                        System.out.print("o");
                                        dibujado = true;
                                        break;
                                    }
                                }

                                if (!dibujado) {
                                    System.out.print(" ");
                                }
                            }
                        }
                    }
                }
                System.out.println();
            }

            System.out.println("Puntuacion: " + (tamano - 1));
            System.out.println("Ingresa una letra (W, A, S, D) y presiona ENTER.");
            System.out.println("Para seguir derecho, teclea X y da ENTER.");

            String tecla = scanner.nextLine().toLowerCase();

            
            if (tecla.equals("w") || tecla.equals("s") || tecla.equals("a") || tecla.equals("d")) {
                if (!(tecla.equals("w") && direccion.equals("s")) &&
                    !(tecla.equals("s") && direccion.equals("w")) &&
                    !(tecla.equals("a") && direccion.equals("d")) &&
                    !(tecla.equals("d") && direccion.equals("a"))) {
                    direccion = tecla;
                }
            }

            
            if (tamano > 1) {
                for (int k = tamano; k >= 2; k--) {
                    colaX[k] = colaX[k - 1];
                    colaY[k] = colaY[k - 1];
                }
            }

            switch (direccion) {
                case "w": cabezaY--; break;
                case "s": cabezaY++; break;
                case "a": cabezaX--; break;
                case "d": cabezaX++; break;
            }

            colaX[1] = cabezaX;
            colaY[1] = cabezaY;

            
            if (cabezaX == 1 || cabezaX == ancho || cabezaY == 1 || cabezaY == alto) {
                gameOver = true;
            }

       
            if (tamano > 1) {
                for (int k = 2; k <= tamano; k++) {
                    if (cabezaX == colaX[k] && cabezaY == colaY[k]) {
                        gameOver = true;
                        break;
                    }
                }
            }

            
            if (cabezaX == manzanaX && cabezaY == manzanaY) {
                if (tamano < maxTamano) {
                    tamano++;
                    colaX[tamano] = colaX[tamano - 1];
                    colaY[tamano] = colaY[tamano - 1];
                }
                manzanaX = random.nextInt(ancho - 2) + 2;
                manzanaY = random.nextInt(alto - 2) + 2;
            }
        }

        System.out.println("=======================");
        System.out.println("      FIN DEL JUEGO    ");
        System.out.println("   Puntuacion: " + (tamano - 1));
        System.out.println("=======================");
    }
}