// Média Aritmética
// Saída: mediaSMA[];

int smaValor;
double mediaSMA[];

void setMediaSMA(int periodo, int deslocamento, ENUM_APPLIED_PRICE fechamento, int qtde) {
   ArraySetAsSeries(mediaSMA, true);
   smaValor = iMA(_Symbol,_Period,periodo,deslocamento,MODE_SMA,fechamento);
   CopyBuffer(smaValor,0,0,qtde,mediaSMA);
}