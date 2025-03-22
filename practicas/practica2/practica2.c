#include <stdio.h>
#include <stdlib.h>
#include <string.h> //Para usar strcpy()
#include <math.h> //Para usar la funcion pow() y obtener la raiz cuarta

float media_arimetica(float datos[], int n)
{
  float s = 0;
  for (int i = 0; i < n; i++)
      s += datos[i];
  
  return s / n;
}

float media_armonica(float datos[], int n)
{
  float s = 0;
  for (int i = 0; i < n; i++)
    s += 1.0 / datos[i];
  
  return n / s;
}

float media_geometrica(float datos[], int n)
{
  float p = 1;
  for (int i = 0; i < n; i++)
    p *= datos[i];
  
  return pow(p, 1.0 / n);
}

int main(int argc, char *argv[])
{
  if (argc < 3) {
    fprintf(stderr, "Uso: %s <tipo de media> <numeros a promediar>\n", argv[0]);
    return EXIT_FAILURE;
  }
  
  char tipo_media = argv[1][0];
  int num_args = argc - 2; //omitimos la ejecucion del programa y el caracter con la media a usar
  float datos[num_args];
  char media[20]; //imprimir la media ingresada
  float promedio;
  
  for (int i = 2; i < argc; i++)
    datos[i - 2] = atof(argv[i]); //strings a floats
  
  switch (tipo_media) {
  case 'A':
    promedio = media_arimetica(datos, num_args);
    strcpy(media, "Aritmética");
    break;
  case 'H':
    promedio = media_armonica(datos, num_args);
    strcpy(media, "Armónica");
    break;
  case 'G':
    promedio = media_geometrica(datos, num_args);
    strcpy(media, "Geométrica");
    break;
  default:
    fprintf(stderr, "Tipo de media no válida. Use A, H o G.\n");
    return EXIT_FAILURE;
  }
    
  printf("Tu promedio usando la media %s es: %.4f\n", media, promedio);
}
