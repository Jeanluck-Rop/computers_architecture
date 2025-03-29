#include <iostream>
using namespace std;

//Función que implementa la serie de Leibniz para aproximar el valor de π.
int main() {
  cout << "Ingrese un valor para m: ";
  int m;          //Creamos la varible m para los términos de la serie
  cin >> m;       //Leemos la varible del usuario
  float r = 0.0f; //El resultado a imprimir
  
  //Bucle para realizar la serie hasta los m términos
  for (int n = 0; n <= m; n++) {
    //Calculamos cada término de la serie, alternamos los valores de 1 y -1
    float j = ((n % 2 == 0) ? 1.0f : -1.0f) / ((2.0f * n) + 1.0f);
    r += j; //Sumamos la división obtenida a nuestros resultados previos 
  }
  
  cout << "Resultado de la serie: " << r * 4.0f << endl;
}
