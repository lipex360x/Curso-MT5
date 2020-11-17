#include "./utils/config/setValidador.mqh"

void OnInit() {
  if(!setValidador()) {
    Print("Chave Inválida");
    return;
  };
  
  Print("Robô Validado Iniciado");
}

void OnTick() {
   if(!validador) return;
   
   Print("Nova linha de código");
}