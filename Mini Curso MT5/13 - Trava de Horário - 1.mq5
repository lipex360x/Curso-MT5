#include "./utils/info/getHorasEmMinutos.mqh"

input string horaInicio; // Hora de Início (hh:mm)
input string horaFim; // Hora de Término (hh:mm)

string horaAtual;


void OnTick() {
   //--- Hora Atual
   horaAtual = TimeToString(TimeCurrent(),TIME_MINUTES); 
   
   if(
      getHorasEmMinutos(horaAtual) >= getHorasEmMinutos(horaInicio) &&
      getHorasEmMinutos(horaAtual) <= getHorasEmMinutos(horaFim)
   ) {
      Comment(
         "Dentro do horário de Trade \n",
         "HoraAtual: ",horaAtual,"\n",
         "HoraAtual Em Minutos: ",getHorasEmMinutos(horaAtual),"\n",
         "HoraInicio: ",getHorasEmMinutos(horaInicio),"\n",
         "HoraFim: ",getHorasEmMinutos(horaFim),"\n"
      );
   } else {
      Comment(
         "HoraAtual: ",horaAtual,"\n",
         "Fora do Horário de Trade"
      );
   }
   
}