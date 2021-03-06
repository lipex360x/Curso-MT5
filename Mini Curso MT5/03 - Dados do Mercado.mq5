// Include de arquivos dentro do diretório INCLUDE
// #include <setMediaSMA.mqh>

#include "./utils/info/setTickInfo.mqh"
#include "./utils/info/setCandleInfo.mqh"

#include "./utils/indicadores/setMediaSMA.mqh"
#include "./utils/indicadores/setMediaEMA.mqh"

double media21;
double media80;

double maximoUltimoCandle;

void OnInit() {
  Print("Robô Iniciado");
}

void OnTick() {
   
   setTickInfo();
   setCandleInfo(2);
   
   maximoUltimoCandle = candleInfo[1].high;
   
   // MEDIA setMediaSMA - Sem RETURN
   setMediaSMA(21,0,PRICE_CLOSE,1);
   media21 = NormalizeDouble(mediaSMA[0],3);
   
   setMediaSMA(80,0,PRICE_CLOSE,3);
   media80 = NormalizeDouble(mediaSMA[2],3);
   
   setMediaSMA(200,0,PRICE_CLOSE,1);
   
   Comment(
      "ultimo negócio: ", tickInfo.last,
      "\nMedia Móvel 21: ",media21,
      "\nMedia Móvel 80: ",media80
     );
}
