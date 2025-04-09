#include <iostream>
#include <bits/stdc++.h>
using namespace std;

//Funcion que implementa el coeficiente binomial n en k utilizando la identidad de Pascal
int coeficiente_binomial(int n, int k) {
  //Si k es mayor a n simplemente devolvemos 0
  if (k > n)
    return 0;
  //Caso base
  if (k == 0 || k == n)
    return 1;
  
  //Paso recursivo utilizando la identidad de Pascal
  return coeficiente_binomial(n - 1, k - 1) + coeficiente_binomial(n - 1, k);
}

int main() {
  int n, k;
  cout<< "Ingrese los valores para n, k: " << endl;
  cin >> n >> k;

  if (n <= -1 || k <= 0) {
    cout << "[ERROR]: Los valores para n, k deben ser positivos.\n" << endl;
    return 0;
  }
    
  int r = coeficiente_binomial(n, k); //El resultado a de realizar el coeficiente
  cout << "El coeficiente binomial (" << n << " en " << k << ") es: " << r << endl;
}
