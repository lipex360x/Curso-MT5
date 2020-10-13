// Média Aritmética
// Saída: mediaSMA[];

int smaValor;
double mediaSMA[];

void setMediaSMA(int periodo, int deslocamento, ENUM_APPLIED_PRICE fechamento, int tamanho) {
   ArraySetAsSeries(mediaSMA, true);
   smaValor = iMA(_Symbol,_Period,periodo,deslocamento,MODE_SMA,fechamento);
   CopyBuffer(smaValor,0,0,tamanho,mediaSMA);
}