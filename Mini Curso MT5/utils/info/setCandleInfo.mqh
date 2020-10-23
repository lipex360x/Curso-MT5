MqlRates candleInfo[];

void setCandleInfo(int qtde) {
   ArraySetAsSeries(candleInfo, true);
   CopyRates(_Symbol, _Period,0, qtde, candleInfo);
}