// Include de arquivos dentro do diretório INCLUDE
// #include <setMediaSMA.mqh>

#include "./utils/indicadores/setMediaSMA.mqh"
#include "./utils/indicadores/setMediaEMA.mqh"

MqlTick ultimoTick;
MqlRates candleInfo[];

double media21;
double media80;

void OnInit() {
  Print("Robô Iniciado");
}

void OnTick() {

   SymbolInfoTick(_Symbol,ultimoTick);
   //Comment("Ultimo Preço: ",ultimoTick.last);
   
   ArraySetAsSeries(candleInfo, true);
   CopyRates(_Symbol, _Period,0,2,candleInfo);
   
   // MEDIA setMediaSMA - Sem RETURN
   setMediaSMA(21,0,PRICE_CLOSE,1);
   media21 = NormalizeDouble(mediaSMA[0],3);
   
   setMediaSMA(80,0,PRICE_CLOSE,3);
   media80 = NormalizeDouble(mediaSMA[2],3);
   
   setMediaSMA(200,0,PRICE_CLOSE,1);
   
   Comment(
      "Media Móvel 21: ",media21,
      "\nMedia Móvel 80: ",media80
     );
}
