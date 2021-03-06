#include <Trade\Trade.mqh>
CTrade trade;

#include "./utils/info/setCandleInfo.mqh"
#include "./utils/info/setTickInfo.mqh"
#include "./utils/indicadores/setMediaSMA.mqh"
#include "./utils/indicadores/setHiLo.mqh"

#include "./utils/ordens/resetPosicao.mqh"

// Informações do Candle
string horaCandleAtual;
string horaCandleFechamento = "00:00";


bool setup[4] = {false, false, false, false};
bool posicionado = false;

string ordem = "";

input int lote = 1;// Lote

double ultimoNegocio;
double stopLoss;
double takeProfit;
double valorOrdem;

double minima;
double maxima;


void OnInit() {
   Print("Robô HiLo");
}

void OnTick() {
   
   // CANDLE INFO
   setCandleInfo(4);
   
   // TICK INFO
   setTickInfo();
   ultimoNegocio = tickInfo.last;
   
   // INDICADOR mediaSMA
   setMediaSMA(6,0,PRICE_CLOSE,4);
   
   // INDICADOR HiLo
   setHilo(6,4);

   // HORA CANDLE ATUAL
   horaCandleAtual = TimeToString(candleInfo[0].time, TIME_MINUTES);


   // MÍNIMA E MÁXIMA
   // Mínima
   if(
      candleInfo[1].low <= candleInfo[2].low &&
      candleInfo[1].low <= candleInfo[3].low
   ) {
      minima = candleInfo[1].low;
   } else if(
      candleInfo[2].low <= candleInfo[1].low &&
      candleInfo[2].low <= candleInfo[3].low
   ) {
      minima = candleInfo[2].low;
   } else {
      minima = candleInfo[3].low;
   }
      
   
   // Máxima
   if(
      candleInfo[1].high >= candleInfo[2].high &&
      candleInfo[1].high >= candleInfo[3].high
   ) {
      maxima = candleInfo[1].high;
   } else if(
      candleInfo[2].high >= candleInfo[1].high &&
      candleInfo[2].high >= candleInfo[3].high
   ) {
      maxima = candleInfo[2].high;
   } else {
      maxima = candleInfo[3].high;
   }
   
   
   // SETUP
   for(int i=1; i<4; i++) {
      // SETUP COMPRA
      if(
         candleInfo[i].close > candleInfo[i].open &&
         candleInfo[i].close > HiLo[i] &&
         candleInfo[0].low > minima
      ) {
         setup[i] = true;
      } 
      
      // SETUP VENDA
      else if(
         candleInfo[i].close < candleInfo[i].open &&
         candleInfo[i].close < HiLo[i] &&
         candleInfo[0].high < maxima
      ) {
         setup[i] = true;
      }
      else {
         setup[i] = false;
      }
   }
   
   for(int i=0; i<3; i++) {
      if(
         setup[i+1] == true &&
         candleInfo[i].close > HiLo[i]
      ) {
         setup[0] = true;
         ordem = "compra";
      } 
      else if(
         setup[i+1] == true &&
         candleInfo[i].close < HiLo[i]
      ) {
         setup[0] = true;
         ordem = "venda";
      } 
      
      else {
         setup[0] = false;
         ordem = "";
         break;
      }
   }
   
  
   // ENVIO DE ORDENS   
   if(
      !posicionado &&
      ordem == "compra" && 
      horaCandleAtual != horaCandleFechamento &&
      ultimoNegocio > maxima
   ) {
      stopLoss = minima - 10;
      takeProfit = ultimoNegocio + (maxima - minima);
      valorOrdem = ultimoNegocio;
      
      trade.Buy(lote,_Symbol,valorOrdem,stopLoss,takeProfit,"Ordem de Compra");
      
      posicionado = true;
   }
   
   if(
      !posicionado &&
      ordem == "venda" &&
      horaCandleAtual != horaCandleFechamento &&
      ultimoNegocio < minima
   ) {
      stopLoss = maxima + 10;
      takeProfit = ultimoNegocio - (maxima - minima);
      valorOrdem = ultimoNegocio;
      
      trade.Sell(lote,_Symbol,valorOrdem,stopLoss,takeProfit,"Ordem de Venda");
      
      posicionado = true;
   }
   
   
   // RESET POSICIONADO
   resetPosicao();
   
}