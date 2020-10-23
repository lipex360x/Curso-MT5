// Média Exponencial
// Saída: mediaEMA[];

int emaValor;
double mediaEMA[];

void setMediaEMA(int periodo, int deslocamento, ENUM_APPLIED_PRICE fechamento, int qtde) {
   ArraySetAsSeries(mediaEMA, true);
   emaValor = iMA(_Symbol,_Period,periodo,deslocamento,MODE_EMA,fechamento);
   CopyBuffer(emaValor,0,0,qtde,mediaEMA);
}