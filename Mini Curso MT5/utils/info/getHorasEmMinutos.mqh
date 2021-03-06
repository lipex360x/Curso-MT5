int horasEmMinutos;

string separador=":";
ushort separadorASCII;
string retorno[];

int getHorasEmMinutos(string horas) {
   
   //--- Obtem o código ASCII do serapador
   separadorASCII = StringGetCharacter(separador,0);
   
   //--- Divide a string em partes
   StringSplit(horas,separadorASCII,retorno);
   
   //--- Transforma horas em minutos no dia
   horasEmMinutos = StringToInteger(retorno[0]) * 60 + StringToInteger(retorno[1]);
   
   return horasEmMinutos;
}