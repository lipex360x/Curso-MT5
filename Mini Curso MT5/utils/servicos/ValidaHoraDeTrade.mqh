class ValidaHoraDeTrade {
   // Parâmetros Privados
   private:
      int horasEmMinutos;
      string separador;
      ushort separadorASCII;
      string retorno[];
      string horaAtual;
   
   // Construtor (opcional) Publico
   public:
      ValidaHoraDeTrade() {      
         //--- Definição do Separador
         separador = ":";
         
         //--- Obtem o código ASCII do serapador
         separadorASCII = StringGetCharacter(separador,0);
      };
   
   // Funções de Execução Privada
   private:
      int getHorasEmMinutos(string horas) {
         //--- Divide a string em partes
         StringSplit(horas,separadorASCII,retorno);
         
         //--- Transforma horas em minutos no dia
         horasEmMinutos = StringToInteger(retorno[0]) * 60 + StringToInteger(retorno[1]);
         
         return horasEmMinutos;
      }
         
   // Funções de Execução Pública
   public:
      bool execute(string horaInicio, string horaFim) {
         //--- Hora Atual
         horaAtual = TimeToString(TimeCurrent(),TIME_MINUTES);
         
         if (
            getHorasEmMinutos(horaAtual) >= getHorasEmMinutos(horaInicio) &&
            getHorasEmMinutos(horaAtual) <= getHorasEmMinutos(horaFim)
         ) {
            return true;
         }
         return false;
      }
      
};