// IFR
// Saída: ifr[];

int ifrValor;
double ifr[];

void setIFR(int periodo, ENUM_APPLIED_PRICE fechamento, int qtde) {
   ArraySetAsSeries(ifr, true);
   ifrValor = iRSI(_Symbol, _Period, periodo, fechamento);
   CopyBuffer(ifrValor,0,0,qtde,ifr);
}
