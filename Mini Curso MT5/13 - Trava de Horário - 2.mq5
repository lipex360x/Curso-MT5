#include "./utils/servicos/ValidaHoraDeTrade.mqh"

input string horaInicio; // Hora de Início (hh:mm)
input string horaFim; // Hora de Término (hh:mm)

ValidaHoraDeTrade horaDeTrade;

void OnTick() {

   Comment(horaDeTrade.execute(horaInicio, horaFim));
   
}